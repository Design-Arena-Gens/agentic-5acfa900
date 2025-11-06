<?php

use App\Lib\Session;

Session::start();
$user = Session::user();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matrimony Connect</title>
    <link rel="stylesheet" href="/assets/css/style.css">
</head>
<body>
<header class="site-header">
    <div class="container">
        <a href="/" class="brand">Matrimony Connect</a>
        <nav>
            <a href="/">Home</a>
            <?php if ($user): ?>
                <a href="/dashboard.php">Dashboard</a>
                <a href="/search.php">Search</a>
                <a href="/profile.php">Profile</a>
                <a href="/interests.php">Interests</a>
                <a href="/logout.php">Logout</a>
            <?php else: ?>
                <a href="/register.php">Register</a>
                <a href="/login.php">Login</a>
            <?php endif; ?>
        </nav>
    </div>
</header>
<main class="container">
