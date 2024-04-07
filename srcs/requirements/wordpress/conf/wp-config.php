<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wpmariadbtest' );

/** Database username */
define( 'DB_USER', 'ADMIN' );

/** Database password */
define( 'DB_PASSWORD', 'TEST' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'k9d8E0Mdb>*=RwP!s))USD*v) OR+F{74}dOl2p<+>2fre9G[RM~6#8}`M +23BS' );
define( 'SECURE_AUTH_KEY',   '*~xL~lxjV/InSQsH.Vdt5+JAd+%,7-[q+u@49q+g~cUN;q{G70vUIP|nzBEN,Nq}' );
define( 'LOGGED_IN_KEY',     'e!,S6/:lHe!-EU5AeDQ}+>;02VwV?#a,+A(JJJ=z:%CS/zzvJ<#^t{)@^LmEq!@J' );
define( 'NONCE_KEY',         '=,hffkgBqqV,{ygzo9Y!p&+ID@{-K{Ajcry3@Iq,{#u}IHi#S-m<1]0Pv7)W`$/z' );
define( 'AUTH_SALT',         'ZT;HDH3v>]k Yu&?.F2(UuV8qM,p^|vZ00AQxBN0k6/{jCjWF}2ap%eJ$}s++bv/' );
define( 'SECURE_AUTH_SALT',  'GsZz9sN{8^O)RY>XvfoEkNg>6BCn]00cvst^OfulDL]FLT*n<)-g&*/{9 xj298T' );
define( 'LOGGED_IN_SALT',    ':v~29xx=sQ.xC5oO: X)c&EArvc;I4!%%oH&{+gx`1OL5|82.VFKy(J jazC5`.m' );
define( 'NONCE_SALT',        '{~(+QJK|0*5;hf)D6C5Ja1uy#g}z%o{1@qbYbCsL73xNplG>P=MPW;5O$LFYJDl/' );
define( 'WP_CACHE_KEY_SALT', 'r%6E01)2BtDuGH/l2kDNiId^TcG`UFew{xhcX#mOX;6uoi|3vzAV;Xo9M/=.8>cO' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
