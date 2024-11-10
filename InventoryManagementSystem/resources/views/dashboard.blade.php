<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/sidenav.css') }}">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">


    <title>Dashboard</title>
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
        <h2>Dashboard</h2>

             <!--KEZ--> 
    <div>     
        <h4 class="aligned-heading">Inventory Summary </h4>
        <hr class="aligned-line">
    </div>

    <div class="box-container">
        
            <div class="box">
                <p>Low Stock Flowers
                    <br><br>
                    <p style="font-size: 30px;"> {{ $lowStockFlowers }} </p>
                </p>
            </div>
            <div class="box">
                <p>Low Stock Candles
                    <br><br>
                    <p style="font-size: 30px;"> {{ $lowStockCandles }} </p>
                </p>
            </div>
            <div class="box">
                <p>Out of Stock Flowers
                    <br><br>
                    <p style="font-size: 30px;"> {{ $outOfStockFlowers }} </p>
                </p>
            </div>

            <div class="box" style="width: 14%;">
                <p>Out of Stock Candles
                    <br><br>
                    <p style="font-size: 30px;"> {{ $outOfStockCandles }} </p>
                </p>
            </div>
            

    </div>
             
   
        <h4 class="aligned-heading">Sales Report Summary</h4>
       

    <div class="sales">   
        <div class="graph">
            
        </div>
                <p >Monthly Sales Summary</p>
   </div> 

        
    </div>
</body>

<script src="{{ asset('js/navbar.js') }}"></script>
</html>