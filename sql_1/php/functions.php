<?php
// php/functions.php

/**
 * Return formatted price string
 * @param float $price
 * @return string
 */
function format_price($price) {
    return '$' . number_format((float)$price, 2);
}

/**
 * Simple function to calculate dog's age in dog years (example)
 * @param int $age_years
 * @return int
 */
function dog_age_in_dog_years($age_years) {
    if ($age_years <= 0) {
        return 0;
    }
    return $age_years * 7;
}
?>
