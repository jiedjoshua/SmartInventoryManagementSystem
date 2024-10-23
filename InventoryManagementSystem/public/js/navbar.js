 // Dropdown functionality
 var dropdown = document.getElementsByClassName("dropdown-btn");
 for (var i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var dropdownContent = this.nextElementSibling;
        if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
        } else {
            dropdownContent.style.display = "block";
        }

        // Reset all links
        resetLinks();
        this.classList.add('active');

        // If dropdown is open, activate the dropdown links
        if (dropdownContent.style.display === "block") {
            var dropdownLinks = dropdownContent.querySelectorAll('a');
            for (var k = 0; k < dropdownLinks.length; k++) {
                dropdownLinks[k].classList.add('active');
                dropdownLinks[k].classList.remove('inactive');
            }
        }
    });
 }

 // Sidebar link activation functionality
 var links = document.querySelectorAll('.sidenav a');
 for (var i = 0; i < links.length; i++) {
    links[i].addEventListener('click', function() {
        // Reset all links
        resetLinks();
        // Add 'active' class to the clicked link
        this.classList.add('active');
        this.classList.remove('inactive');

        // Close the dropdown if it is open
        var dropdowns = document.querySelectorAll('.dropdown-container');
        for (var j = 0; j < dropdowns.length; j++) {
            dropdowns[j].style.display = 'none'; // Close all dropdowns
        }
        var dropdownButtons = document.querySelectorAll('.dropdown-btn');
        for (var j = 0; j < dropdownButtons.length; j++) {
            dropdownButtons[j].classList.remove('active'); // Deactivate dropdown buttons
        }
    });
 }

 // Function to reset link states
 function resetLinks() {
    var links = document.querySelectorAll('.sidenav a');
    for (var j = 0; j < links.length; j++) {
        links[j].classList.remove('active');
        links[j].classList.add('inactive');
    }
 }
