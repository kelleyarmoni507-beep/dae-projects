<?php
// php/breed.php
// Demonstrates PHP variables, array, decision, functions, includes.

include_once 'functions.php'; // modularize and reuse code

// Variables of different types
$siteName = "Paws & Breeds";          // string
$availablePuppies = 3;                // integer
$isAvailable = true;                  // boolean

// One-dimensional array (at least one) - access used later
$breeds = array("Labrador", "Beagle", "German Shepherd", "Poodle");

// Decision making (if/else)
if ($availablePuppies > 0 && $isAvailable) {
    $availabilityMessage = "We have puppies available now!";
} else {
    $availabilityMessage = "No puppies available at the moment.";
}

// Use function from functions.php
$samplePrice = 1200.50;
$priceFormatted = format_price($samplePrice);
$dogYears = dog_age_in_dog_years(2); // 2 human years => dog years

?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title><?php echo htmlspecialchars($siteName); ?> — Breed Details</title>
  <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>
  <header>
    <h1><?php echo htmlspecialchars($siteName); ?></h1>
    <nav>
      <ul>
        <li><a href="../index.html">Home</a></li>
        <li><a href="../about.html">About</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <section>
      <h2>Available Breeds</h2>
      <p><?php echo $availabilityMessage; ?></p>

      <h3>Breeds we raise</h3>
      <ul>
        <?php
        // iterate the array (accessing it)
        foreach ($breeds as $i => $breed) {
            // show different attributes & demonstrate usage of index
            echo "<li data-index='{$i}' class='breed-item'>" . htmlspecialchars($breed) . "</li>";
        }
        ?>
      </ul>

      <h3>Example price and age conversion</h3>
      <p>Typical puppy price (example): <?php echo $priceFormatted; ?></p>
      <p>Example: a 2-year-old dog is about <?php echo $dogYears; ?> dog years.</p>

      <h3>Check availability</h3>
      <p>
        <?php
        // Decision structure with nested if
        if ($availablePuppies >= 3) {
            echo "We currently have several puppies. Contact us!";
        } elseif ($availablePuppies > 0) {
            echo "Limited puppies left — hurry!";
        } else {
            echo "Please join our waiting list.";
        }
        ?>
      </p>
    </section>
  </main>

  <footer>
    <p>&copy; 2025 Paws & Breeds</p>
  </footer>
</body>
</html>
