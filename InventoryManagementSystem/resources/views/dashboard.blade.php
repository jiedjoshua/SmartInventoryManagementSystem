<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/sidenav.css') }}">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


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
        <a href="{{ route('sales') }}">Sales Report</a>
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

    <div class="box-container" style="margin-bottom: 40px;">
        
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
             

        <div>
        <h4 class="aligned-heading" style="margin-bottom: 20px; margin-top:0px">Stock Report</h4>
        <br>
            <label for="productType">Select Product Type:</label>
            <select id="productType" onchange="updateGraph()">
                <option value="flowers">Flowers</option>
                <option value="candles">Candles</option>
            </select>
        </div>


    <div class="sales" style="width: 94%;">   
       
        <canvas id="stockGraph" width="400" height="160"></canvas>
    
                
   </div> 

        
    </div>

<script>
    // Get data from Blade variables
    const flowerNames = @json($flowerNames);
    const flowerQuantities = @json($flowerQuantities);
    const candleNames = @json($candleNames);
    const candleQuantities = @json($candleQuantities);

    // Initial chart setup (default is 'flowers')
    let chart = null;
    const ctx = document.getElementById('stockGraph').getContext('2d');

    function createChart(labels, data) {
        if (chart) {
            chart.destroy();
        }

        chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Stock Quantity',
                    data: data,
                    borderColor: 'rgba(113, 55, 55, 1)',
                    backgroundColor: 'rgba(113, 55, 55, 0.2)',
                    borderWidth: 2
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
    }

    // Function to update the graph when a product type is selected
    function updateGraph() {
        const productType = document.getElementById('productType').value;
        
        if (productType === 'flowers') {
            createChart(flowerNames, flowerQuantities);
        } else if (productType === 'candles') {
            createChart(candleNames, candleQuantities);
        }
    }

    // Initialize the chart with flowers data by default
    updateGraph();
</script>


   

</body>

<script src="{{ asset('js/navbar.js') }}"></script>
</html>