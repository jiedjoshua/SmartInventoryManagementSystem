document.addEventListener("DOMContentLoaded", function () {
    // Set the default month to the current month
    var currentMonth = new Date().getMonth();
    var months = [
        "January", "February", "March", "April", "May", "June", "July", "August", 
        "September", "October", "November", "December"
    ];
    document.getElementById('month-select').value = months[currentMonth];

    // Call the function to fetch data based on the current month
    filterByMonth();

    // Function to filter and display data based on selected month
    document.getElementById('month-select').addEventListener('change', function () {
        filterByMonth();
    });

    function filterByMonth() {
        var month = document.getElementById('month-select').value;

        // Use AJAX to fetch filtered data
        if (month) {
            fetch(`/filter-sales?month=${month}`)
                .then(response => response.json())
                .then(data => {
                    updateSalesTable(data.flowerSales, 'flowers-table');
                    updateSalesTable(data.candleSales, 'candles-table');
                })
                .catch(error => console.error('Error fetching data:', error));
        }
    }

    function updateSalesTable(data, tableId) {
        var tableBody = document.getElementById(tableId).getElementsByTagName('tbody')[0];
        tableBody.innerHTML = ''; // Clear current data

        data.forEach(sale => {
            var row = tableBody.insertRow();
            row.innerHTML = `<td>${sale.product_name}</td><td>${sale.quantity_sold}</td>`;
        });
    }
});
