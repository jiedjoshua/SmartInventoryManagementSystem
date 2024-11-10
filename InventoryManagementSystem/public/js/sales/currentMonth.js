document.addEventListener("DOMContentLoaded", function() {
    // Get the current month as a number (0 - 11)
    var currentMonth = new Date().getMonth(); // Returns 0 for January, 1 for February, etc.

    // Array of month names corresponding to the option values
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

    // Set the selected value to the current month in the dropdown
    document.getElementById('month-select').value = months[currentMonth];

    // Optionally, you can trigger the filter function to load data for the current month
    filterByMonth();
});