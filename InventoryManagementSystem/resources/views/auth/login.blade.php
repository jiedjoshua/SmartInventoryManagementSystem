<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/login.css') }}">
    <title>Login</title>
</head>
<body>
    <div class="login-container">
        <form method="POST" action="{{ route('login') }}">
            @csrf
            <div class="logo-container">
                <h1>Petals & Posies</h1>
                <p>Beauty, always within reach</p>
            </div>
            <h2>Login</h2>
            
            <!-- Email Input -->
            <input type="email" name="email" placeholder="Email" value="{{ old('email') }}">
            <!-- Error for Email -->
            <div class="error-placeholder">
                @error('email')
                    <div class="error-message">{{ $message }}</div>
                @enderror
            </div>

            <!-- Password Input -->
            <input type="password" name="password" placeholder="Password">
            <!-- Error for Password -->
            <div class="error-placeholder">
                @error('password')
                    <div class="error-message">{{ $message }}</div>
                @enderror
            </div>
            
            <!-- Login Button -->
            <button type="submit" id="login-button">Login</button>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const errorMessages = document.querySelectorAll('.error-message');
            const loginButton = document.getElementById('login-button');
            
            let errorVisible = Array.from(errorMessages).some(error => error.innerHTML.trim() !== '');
            
            if (errorVisible) {
                loginButton.style.marginTop = '10px';
            } else {
                loginButton.style.marginTop = '0px'; // default margin
            }
        });
    </script>
</body>
</html>
