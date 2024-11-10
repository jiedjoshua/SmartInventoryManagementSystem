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
    <h2>Orders</h2>
    <div class="row" style="display: flex;">
        <div class="column" style="flex: 50%; padding: 10px;">
            <table>
                <tr> 
                    <th colspan="4">Monthly</th> 
                </tr>
                <tr>
                    <td><b>Month</b></td>
                    <td><b>Total Sales</b></td>
                    <td><b>Flower Sold</b></td>
                    <td><b>Candles Sold</b></td>
                </tr>
                @foreach($monthlySales as $sale)
                <tr>
                    <td>{{ $sale->month }}</td>
                    <td>{{ $sale->total_sales }}</td>
                    <td>{{ $sale->flowers_sold }}</td>
                    <td>{{ $sale->candles_sold }}</td>
                </tr>
                @endforeach
            </table>
        </div>
        <div class="column" style="flex: 50%; padding: 10px;">
            <table>
                <tr> 
                    <th colspan="4">Annually</th> 
                </tr>
                <tr>
                    <td><b>Year</b></td>
                    <td><b>Total Sales</b></td>
                    <td><b>Flower Sold</b></td>
                    <td><b>Candles Sold</b></td>
                </tr>
                @foreach($yearlySales as $sale)
                <tr>
                    <td>{{ $sale->year }}</td>
                    <td>{{ $sale->total_sales }}</td>
                    <td>{{ $sale->flowers_sold }}</td>
                    <td>{{ $sale->candles_sold }}</td>
                </tr>
                @endforeach
            </table>
        </div>
    </div>
    <div class="lagay" style="padding: 10px;"> <!-- papalit -->
        <table border="1" style="width:100%; text-align:left; margin-top: 20px;">
            <tr>
                <td style="height: 200px;"></td> 
            </tr>
        </table>
    </div>
</div>
</body>
<script src="{{ asset('js/navbar.js') }}"></script>
</html>