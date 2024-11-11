<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/orders.css') }}">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <title>Inventory Management</title>
</head>
<body>
<div class="sidenav">
    <div class="logo-container">
         <h1>Petals & Posies</h1>
         <p>Inventory Management System</p>
    </div>
    <div class="link-container">
        <a href="{{ route('dashboard') }}">Dashboard</a>
        <button class="dropdown-btn">Inventory Management
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="{{ route('flowers') }}">Flowers</a>
            <a href="{{ route('candles') }}">Candles</a>
            <a href="{{ route('orders') }}">Orders</a>
        </div>
        <a href="#contact">Sales Report</a>
    </div>

    <div class="logout-container">
        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
            @csrf
        </form>
        <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
            Logout
        </a>
    </div>
</div>

<div class="content">
    <h2>Orders</h2>
    <h3 style="font-weight: lighter;">Predicted orders for {{ $nextMonth }}</h3>
    <select id="product-type" onchange="filterProducts()">
        <option value="">All</option>
        <option value="flowers">Flowers</option>
        <option value="candles">Candles</option>
    </select>
    <table border="1" style="width:100%; text-align:left; margin-top: 20px;" id="orders-table">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
            </tr>
        </thead>
        <tbody>
        @foreach($predictedOrders as $prediction)
            <tr class="product-row" data-product-type="{{ strtolower($prediction['product_type']) }}">
                <td>{{ $prediction['product_name'] }}</td>
                <td>{{ $prediction['quantity'] }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>

<script>
// Function to filter products based on the dropdown selection
function filterProducts() {
    const selectedType = document.getElementById('product-type').value.toLowerCase(); // Normalize input to lowercase
    const rows = document.querySelectorAll('.product-row');
    
    rows.forEach(row => {
        let productType = row.getAttribute('data-product-type').toLowerCase(); // Normalize product type to lowercase
        
        // Adjust productType to ensure singular/plural consistency (e.g., treat "flower" as "flowers" and "candle" as "candles")
        if (productType === 'flower') {
            productType = 'flowers'; // Ensure singular/plural consistency for flowers
        } else if (productType === 'candle') {
            productType = 'candles'; // Ensure singular/plural consistency for candles
        }

        // Log both values to see what's happening
        console.log('Selected Type:', selectedType, 'Product Type:', productType);
        
        if (selectedType === '' || productType === selectedType) {
            row.style.display = '';  // Show row if type matches or no filter selected
        } else {
            row.style.display = 'none';  // Hide row if type does not match
        }
    });
}

// Call the filterProducts() on page load to apply the initial display state
window.onload = function() {
    filterProducts(); // Ensure filter is applied correctly on initial load
};


</script>

</body>

<script src="{{ asset('js/navbar.js') }}"></script>
</html>
