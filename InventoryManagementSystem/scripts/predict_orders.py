import mysql.connector
import pandas as pd
from sklearn.linear_model import LinearRegression
import numpy as np
import json

# Connect to the database
db_connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",  # Add your password if required
    database="inventorymanagementsystem"
)

# Create a cursor to interact with the database
cursor = db_connection.cursor()

# Query to fetch sales data, with polymorphic product type
query = """
    SELECT s.sales_id, s.product_id, s.product_type, s.quantity_sold, s.year, s.month, f.name AS flower_name, c.name AS candle_name
    FROM sales_data s
    LEFT JOIN flowers f ON s.product_type = 'App\\\\Models\\\\Flower' AND s.product_id = f.id
    LEFT JOIN candles c ON s.product_type = 'App\\\\Models\\\\Candle' AND s.product_id = c.id
"""

# Execute the query
cursor.execute(query)

# Fetch all results
sales_data = cursor.fetchall()

# Create a DataFrame from the fetched data
df = pd.DataFrame(sales_data, columns=['sales_id', 'product_id', 'product_type', 'quantity_sold', 'year', 'month', 'flower_name', 'candle_name'])

# Close the cursor and the connection
cursor.close()
db_connection.close()

# Data Preprocessing: Encode product_type
df['product_type_encoded'] = df['product_type'].apply(lambda x: 0 if 'Flower' in x else 1)

# Filter the data for December 2023 (for training)
df_december_2023 = df[(df['year'] == 2023) & (df['month'] == 'December')]

# Initialize list to store predictions
all_products = []

# Predict for flowers (based on individual products)
for _, flower_row in df[df['product_type_encoded'] == 0].drop_duplicates('product_id').iterrows():
    product_id = flower_row['product_id']
    product_name = flower_row['flower_name']
    product_type = "Flower"
    
    # Filter data for the specific product's sales in December 2023
    product_sales = df_december_2023[df_december_2023['product_id'] == product_id]
    
    if not product_sales.empty:
        # Define features and target variable for training this product
        X = product_sales[['product_type_encoded', 'quantity_sold']].to_numpy()
        y = product_sales['quantity_sold']
        
        # Create and train the linear regression model for this product
        model = LinearRegression()
        model.fit(X, y)
        
        # Predict the quantity to order for this product in December 2024
        predicted_quantity = round(model.predict(np.array([[0, product_sales['quantity_sold'].mean()]]))[0])
        all_products.append([product_id, product_name, product_type, predicted_quantity])

# Predict for candles (based on individual products)
for _, candle_row in df[df['product_type_encoded'] == 1].drop_duplicates('product_id').iterrows():
    product_id = candle_row['product_id']
    product_name = candle_row['candle_name']
    product_type = "Candle"
    
    # Filter data for the specific product's sales in December 2023
    product_sales = df_december_2023[df_december_2023['product_id'] == product_id]
    
    if not product_sales.empty:
        # Define features and target variable for training this product
        X = product_sales[['product_type_encoded', 'quantity_sold']].to_numpy()
        y = product_sales['quantity_sold']
        
        # Create and train the linear regression model for this product
        model = LinearRegression()
        model.fit(X, y)
        
        # Predict the quantity to order for this product in December 2024
        predicted_quantity = round(model.predict(np.array([[1, product_sales['quantity_sold'].mean()]]))[0])
        all_products.append([product_id, product_name, product_type, predicted_quantity])

# Create a DataFrame with the correct number of columns
prediction_df = pd.DataFrame(all_products, columns=['Product ID', 'product_name', 'product_type', 'quantity'])

# Convert the DataFrame to a JSON object
prediction_json = prediction_df.to_json(orient='records', lines=False)

# Save the JSON to a file
with open("predicted_orders_next_month.json", "w") as json_file:
    json.dump(json.loads(prediction_json), json_file, indent=4)

# Print the JSON to confirm
print(prediction_json)
