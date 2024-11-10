<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/orders.css') }}">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <title>Sales Report</title>
</head>
<body>
<div class="sidenav">
<div class="logo-container">
     <h1>Petals & Posies</h1>
     <p>Inventory Management System</p>
</div>
<div class="link-container"> 
    <a href="{{ route ('dashboard') }}">Dashboard</a>
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

  <div class="logout-container"> <!-- New container for the logout button -->
        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
            @csrf
        </form>
        <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
            Logout
        </a>
    </div>
</div>

<div class="content">
    <h2>Sales Report</h2>
    <div class="month-dropdown">
        <label for="month-select">Select Month: </label>
        <select id="month-select" onchange="filterByMonth()">
            <option value="">--Select Month--</option>
            <option value="January">January</option>
            <option value="February">February</option>
            <option value="March">March</option>
            <option value="April">April</option>
            <option value="May">May</option>
            <option value="June">June</option>
            <option value="July">July</option>
            <option value="August">August</option>
            <option value="September">September</option>
            <option value="October">October</option>
            <option value="November">November</option>
            <option value="December">December</option>
        </select>
    </div>

    <div class="row" style="display: flex;">
        <div class="column" style="flex: 50%; padding: 10px;">
            <table id="flowers-table">
                <thead>
                <tr> 
                    <th colspan="4">Flowers</th> 
                </tr>
                <tr>
                    <td><b>Product Name</b></td>
                    <td><b>Quantity Sold</b></td>
                </tr>
            </thead>
                <tbody>
                        <!-- Dynamic rows for flowers sales data will go here -->
                    </tbody>
                
            </table>
        </div>
        <div class="column" style="flex: 50%; padding: 10px;">
            <table id="candles-table">
                <thead>
                <tr> 
                    <th colspan="4">Candles</th> 
                </tr>
                <tr>
                    <td><b>Product Name</b></td>
                    <td><b>Quantity Sold</b></td>
                </tr>
                </thead>
                <tbody>
                        <!-- Dynamic rows for flowers sales data will go here -->
                    </tbody>
            </table>
        </div>
    </div>
    <div class="lagay" style="padding: 10px;"> 
    <canvas id="salesChart" width="400" height="100"></canvas>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Fetch sales data from the backend
        fetch("{{ url('/sales-overview') }}")
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Sales data:', data); // Log the fetched data to see what we get
                
                const months = data.months;
                const salesData = data.sales;

                // Create the chart with dynamic data
                const ctx = document.getElementById('salesChart').getContext('2d');
                const salesChart = new Chart(ctx, {
                    type: 'bar', // or 'bar', 'pie', etc.
                    data: {
                        labels: months,
                        datasets: [{
                            label: 'Overall Sales',
                            data: salesData,
                            borderColor: 'rgba(113, 55, 55, 1)',
                            backgroundColor: 'rgba(113, 55, 55, 0.2)',
                            borderWidth: 2,
                            fill: false, // Set to true if you want the area under the line to be filled
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            })
            .catch(error => {
                console.error('Error fetching sales data:', error);
            });
    });
</script>



<script src="{{ asset('js/sales/currentMonth.js') }}"></script>
<script src="{{ asset('js/sales/filterByMonth.js') }}"> </script>
</body>
<script src="{{ asset('js/navbar.js') }}"></script>

</html>