DROP TABLE IF EXISTS alien_types;
CREATE TABLE alien_types (
                             alien_type_id serial PRIMARY KEY,
                             type varchar(64),
                             description varchar(1024),
                             image varchar(64),
                             svg varchar,
                             severity int,
                             modified_date timestamp with time zone default CURRENT_TIMESTAMP
);

INSERT INTO alien_types (type, description, image, svg, severity)
VALUES
(
    'Iska Hopia',
    'These aliens are a type of cat, reported to love chocolate ice cream and warm blankets.',
    'GiSparkSpirit',
    'M 420.402 19.873 c 37.886 49.484 19.76 88.205 -39.797 90.787 c 15.374 -23.54 18.565 -50.758 -1.503 -72.215 c 15.56 37.318 -14.397 62.848 -50.137 67.096 c -4.39 -0.934 -8.887 -1.99 -13.508 -3.19 c -60.132 -15.624 -114.527 22.936 -137.37 78.923 c -0.43 -34.33 9.72 -68.377 29.83 -102.152 c -50.37 35.038 -75.926 89.323 -72.616 166.003 l -59.41 -65.365 L 89.55 374.43 L 254.15 494.025 L 392.703 389.54 l 52.584 -196.853 l -93.224 72.415 c -23.56 -25.652 -13.02 -55.2 33.736 -50.293 c -38.077 -22.19 -64.97 -2.473 -75.952 24.356 c -5.608 -27.825 18.206 -63.122 50.218 -58.686 c 76.728 10.638 151.882 -107.834 60.336 -160.607 Z M 119.838 272.05 l 94.777 73.214 l -103.095 -21.22 l 29.263 -3.05 l -20.945 -48.943 Z m 255.48 12.237 l -10.623 25.262 l 27.8 -0.28 l -12.095 23.437 l -96.25 14.438 l 91.168 -62.858 Z M 204.305 360.13 l 42.256 62.552 l 11.247 -44.094 l 17.84 32.598 l 56.574 -48.54 l -7.23 24.368 l 51.71 -21.274 l -54.485 61.82 l 9.654 -29.966 l -76.21 71.62 l -47.574 -55.136 l 3.176 27.483 l -74.627 -77.593 l 61.166 29.998 l 6.505 -33.834 Z',
    1
),
(

    'Riben Flaven',
    'Their wide mouths and narrow noses often make these aliens appear to be modest, but looks can be deceiving. Their ears are almost invisible and their hearing is amazing. They also have three horns on their heads.',
    'GiBarbarian',
    'M256 32.796c-29.75 0-68.891 11.577-99.588 28.844-15.348 8.633-28.61 18.674-37.685 28.884C109.65 100.735 105 110.796 105 119.796c0 1 .75 3.54 3.62 7.164 2.867 3.623 7.55 8.046 13.503 12.809 11.906 9.524 28.805 20.496 46.87 32.539 31.444 20.963 66.69 44.82 87.007 74.048 20.317-29.229 55.563-53.085 87.008-74.048 18.064-12.043 34.963-23.015 46.869-32.54 5.953-4.762 10.636-9.185 13.504-12.808 2.868-3.623 3.619-6.164 3.619-7.164 0-9-4.65-19.06-13.727-29.272-9.076-10.21-22.337-20.251-37.685-28.884C324.89 44.373 285.75 32.796 256 32.796zm-96 55c16 0 80 48 80 80-49.427-32.146-80-32-80-32-16-16-16-48 0-48zm192 0c16 0 16 32 0 48 0 0-30.573-.146-80 32 0-32 64-80 80-80zM124.389 216.099c-1.259 0-2.503.037-3.73.107-.326.019-.644.055-.968.078 4.622 3.44 8.605 7.731 11.797 12.52 7.195 10.792 10.748 24.327 8.934 37.931-1.338 10.032-5.833 20.055-13.715 28.377 1.736 1.92 3.344 4.07 4.99 6.438 7.078 10.176 14.145 24.717 21.242 41.256 1.2 2.797 2.396 5.651 3.586 8.54 10.648-6.648 22.597-10.931 35.457-10.529 1.92.06 3.862.224 5.82.5 12.583 1.776 25.386 7.956 38.677 19.051a288.157 288.157 0 0 0 3.953-6.65c-4.372-16.06-11.582-34.608-20.555-52.612-18.748-37.617-46.579-72.377-66.69-79.558-10.431-3.725-19.989-5.453-28.798-5.45zm263.222 0c-8.81-.004-18.367 1.724-28.798 5.449-20.111 7.18-47.942 41.941-66.69 79.558-8.973 18.004-16.183 36.551-20.555 52.612 1.26 2.194 2.591 4.42 3.953 6.65 13.29-11.095 26.094-17.275 38.676-19.05 1.96-.277 3.9-.44 5.82-.5 12.86-.403 24.81 3.88 35.458 10.529 1.19-2.89 2.385-5.744 3.586-8.541 7.097-16.54 14.164-31.08 21.242-41.256 1.646-2.367 3.254-4.517 4.99-6.438-7.882-8.322-12.377-18.345-13.715-28.377-1.814-13.604 1.739-27.14 8.934-37.931 3.192-4.789 7.175-9.08 11.797-12.52-.324-.023-.642-.06-.967-.078a65.622 65.622 0 0 0-3.73-.107zm-293.047 9.718a23.893 23.893 0 0 0-4.12.39c-4.146 2.676-8.089 5.835-11.856 9.425-19.142 18.24-32.817 48.68-38.734 82.889-5.918 34.207-4.163 72.009 5.894 104.39 6.921 22.286 17.755 41.725 32.348 56.293-7.482-25.49-12.588-54.061-12.727-82.312-.192-39.136 9.156-78.077 36.291-105.371 1.569-1.578 3.7-2.926 6.031-3.694 9.491-6.578 13.73-14.786 14.887-23.47 1.186-8.896-1.261-18.361-6.066-25.569-4.806-7.208-11.614-11.916-19.076-12.805-.933-.11-1.89-.169-2.872-.166zm322.872 0a23.654 23.654 0 0 0-2.872.166c-7.462.889-14.27 5.597-19.076 12.805-4.805 7.208-7.252 16.673-6.066 25.568 1.158 8.685 5.396 16.893 14.887 23.471 2.331.768 4.462 2.116 6.03 3.694 27.136 27.294 36.484 66.235 36.292 105.37-.14 28.252-5.245 56.823-12.727 82.313 14.593-14.568 25.427-34.007 32.348-56.293 10.057-32.381 11.812-70.183 5.894-104.39-5.917-34.208-19.592-64.65-38.734-82.89-3.767-3.589-7.71-6.748-11.855-9.425a23.856 23.856 0 0 0-4.121-.389zM223.54 236.642l-4.668 25.673c6.142 9.82 11.863 20.228 17.113 30.762 8.339 16.73 15.233 33.836 20.012 49.658 4.78-15.822 11.678-32.928 20.016-49.658 5.25-10.534 10.971-20.943 17.113-30.762l-4.668-25.673c-10.553 10.212-19.153 20.668-24.408 31.18L256 283.92l-8.05-16.1c-5.256-10.511-13.856-20.967-24.409-31.18zM189.412 358.77c-.642.01-1.283.039-1.92.084-7.645.535-14.922 3.493-22.58 8.482-18.513 12.06-29.046 29.471-33.531 52.262-3.334 16.942-3.043 36.818.517 58.691 7.15-14.08 14.765-30.503 22.176-44.867 5.776-11.194 11.273-20.973 17.479-27.951 3.103-3.49 6.382-6.572 11.355-8.092 4.974-1.52 11.702.299 15.455 4.053l15.117 15.117c2.063-2.118 5.486-7.853 8.249-14.299 4.073-9.506 6.651-18.326 8.09-23.52-13.398-12.427-24.835-18.221-34.532-19.59a37.478 37.478 0 0 0-5.875-.37zm133.176 0a37.478 37.478 0 0 0-5.875.37c-9.697 1.369-21.134 7.163-34.531 19.59 1.438 5.194 4.016 14.014 8.09 23.52 2.762 6.446 6.185 12.18 8.248 14.299l15.117-15.117c3.753-3.754 10.481-5.573 15.455-4.053 4.973 1.52 8.252 4.603 11.355 8.092 6.206 6.978 11.703 16.757 17.479 27.95 7.411 14.365 15.026 30.789 22.176 44.868 3.56-21.873 3.851-41.75.517-58.691-4.485-22.791-15.018-40.203-33.531-52.262-7.658-4.989-14.935-7.947-22.58-8.483a36.203 36.203 0 0 0-1.92-.084zM256 362.726a300.28 300.28 0 0 1-6.125 10.216l.092.092-1.237 4.945s-4.051 16.411-10.459 31.362c-3.203 7.475-6.71 14.621-12.158 20.068-2.723 2.724-6.272 5.322-11.15 5.863-4.878.542-10-1.787-13.326-5.113l-3.2-3.199c-3.24 1.637-6.565 2.987-9.988 3.953a44.166 44.166 0 0 0 2.783 4.275c4.507 6.084 11.133 13.22 18.694 19.834 15.12 13.231 34.574 23.774 46.074 23.774s30.953-10.543 46.074-23.774c7.56-6.615 14.187-13.75 18.694-19.834a44.166 44.166 0 0 0 2.783-4.275c-3.423-.966-6.748-2.316-9.989-3.953l-3.199 3.2c-3.326 3.325-8.448 5.654-13.326 5.112-4.878-.541-8.427-3.14-11.15-5.863-5.447-5.447-8.955-12.593-12.158-20.068-6.408-14.951-10.46-31.362-10.46-31.362l-1.236-4.945.092-.092A300.28 300.28 0 0 1 256 362.726z',
    3
);

/*
update alien_types
set severity = 3
where alien_type_id = 1

select * from "enriched-sightings"
 */

INSERT INTO alien_types (type, description, image, svg, severity) VALUES
(
    'KoolAi Mann',
    'They have six eyes which sit lightly in their sockets and can often make them appear to be evil. Their eyesight is excellent.',
    'GiAlienBug',
    'M 197.584 23.28 c -18.284 0.166 -34.4 4.378 -48.488 12.285 C 120.92 51.38 102.008 80.7 87.62 117.445 c -0.637 1.623 -1.254 3.282 -1.874 4.936 a 433.13 433.13 0 0 0 16.73 6.654 c 0.628 -1.69 1.26 -3.378 1.905 -5.028 c 13.612 -34.757 30.7 -59.935 53.524 -72.746 c 11.413 -6.405 24.546 -10.037 40.137 -10.136 c 15.592 -0.1 33.64 3.335 54.884 11.06 L 256 53.3 l 3.076 -1.116 c 42.486 -15.45 72.195 -13.735 95.02 -0.924 c 22.824 12.81 39.912 37.99 53.523 72.746 c 0.645 1.65 1.276 3.338 1.905 5.028 a 433.14 433.14 0 0 0 16.73 -6.653 c -0.62 -1.653 -1.238 -3.312 -1.874 -4.936 c -14.388 -36.743 -33.3 -66.065 -61.476 -81.88 C 335.38 20.117 300.046 18.895 256 34.27 c -21.502 -7.506 -40.977 -11.15 -58.416 -10.99 Z m -16.145 85.35 c -4.77 5.446 -9.19 11.48 -13.268 18.068 c -3.655 5.905 -7 12.262 -10.037 19.01 l 0.16 0.035 c 0.235 -0.005 0.47 -0.018 0.705 -0.018 a 32.61 32.61 0 0 1 13.77 3.05 a 439.41 439.41 0 0 0 49.494 6.62 c -15.17 -15.56 -29.05 -32.14 -40.825 -46.764 Z m 157.474 10.652 c -9.547 9.597 -17.313 20.762 -23.076 33.34 a 438.226 438.226 0 0 0 23.387 -3.846 a 32.61 32.61 0 0 1 13.775 -3.05 c 0.236 0 0.47 0.012 0.705 0.017 l 0.16 -0.035 c -3.036 -6.748 -6.382 -13.105 -10.037 -19.01 a 147.53 147.53 0 0 0 -4.914 -7.416 Z M 37.727 138.725 l 22.34 22.34 l 7.445 -22.34 Z m 406.76 0 l 7.447 22.34 l 22.34 -22.34 Z M 85.526 141.61 l -10.187 30.564 c 17.367 6.233 34.72 11.564 52.062 16.002 c -0.906 -3 -1.4 -6.17 -1.4 -9.45 c 0 -7.88 2.816 -15.144 7.486 -20.84 a 453.046 453.046 0 0 1 -47.96 -16.276 Z m 340.95 0 a 452.977 452.977 0 0 1 -47.967 16.267 c 4.673 5.7 7.492 12.966 7.492 20.848 c 0 3.276 -0.492 6.444 -1.396 9.44 a 579.07 579.07 0 0 0 52.058 -15.99 Z M 159 163.725 c -8.39 0 -15 6.61 -15 15 s 6.61 15 15 15 s 15 -6.61 15 -15 s -6.61 -15 -15 -15 Z m 194 0 c -8.39 0 -15 6.61 -15 15 s 6.61 15 15 15 s 15 -6.61 15 -15 s -6.61 -15 -15 -15 Z m -31.78 6.184 a 454.296 454.296 0 0 1 -12.21 1.585 c -2.643 9.64 -4.27 19.926 -4.8 30.808 a 509.808 509.808 0 0 0 23.265 -2.752 c -4.663 -5.694 -7.475 -12.953 -7.475 -20.825 c 0 -3.05 0.43 -6.005 1.22 -8.816 Z m -130.433 0.014 a 32.614 32.614 0 0 1 1.213 8.8 c 0 7.875 -2.813 15.136 -7.48 20.83 a 510.61 510.61 0 0 0 34.617 3.73 c 0.32 -6.48 -3.405 -30.475 -3.405 -30.475 a 456.76 456.76 0 0 1 -24.945 -2.886 Z m 51.604 4.64 l -8.644 6.897 l 13.88 83.265 h 16.75 L 275.4 198.57 c -11.192 -6.3 -22.285 -14.618 -33.01 -24.007 Z M 66.28 188.16 c -15.22 63.397 -26.077 137.993 -43.05 211.542 l -1.8 7.804 l 7.543 2.696 a 14845.5 14845.5 0 0 0 43.41 15.453 a 417.662 417.662 0 0 1 12.77 -4.47 c 5.114 -1.703 10.176 -3.32 15.11 -4.903 c -17.488 -6.054 -36.565 -12.83 -57.777 -20.403 C 58.5 324.755 69.37 253.65 83.47 194.134 a 613.683 613.683 0 0 1 -17.19 -5.974 Z m 379.44 0 a 613.688 613.688 0 0 1 -17.19 5.975 c 14.1 59.517 24.97 130.62 40.984 201.744 c -21.212 7.57 -40.29 14.348 -57.776 20.402 c 4.933 1.582 9.995 3.2 15.108 4.904 a 417.657 417.657 0 0 1 12.77 4.47 c 13.545 -4.79 27.904 -9.916 43.41 -15.454 l 7.544 -2.696 l -1.8 -7.804 c -16.973 -73.55 -27.83 -148.145 -43.05 -211.54 Z m -305.408 21.694 c -2.188 15.23 -3.312 31.277 -3.312 47.87 c 0 48 0.646 86.742 14.814 111.536 c 7.085 12.397 17.22 21.812 33.647 28.657 c 16.428 6.844 39.29 10.808 70.54 10.808 c 31.25 0 54.112 -3.964 70.54 -10.808 c 16.426 -6.845 26.56 -16.26 33.646 -28.657 C 374.354 344.466 375 305.725 375 257.725 c 0 -16.594 -1.124 -32.64 -3.313 -47.87 c -27.274 6.046 -54.568 9.943 -81.87 11.71 l -2.413 14.484 c 21.605 2.345 46.537 -6.993 77.395 -18.737 l 6.4 16.824 c -7.816 2.975 -15.448 5.92 -22.948 8.63 c 4.365 3.607 7.7 8.663 7.7 14.958 c 0 8.2 -5.652 14.307 -11.88 17.834 c -6.228 3.526 -13.82 5.31 -22.095 5.31 c -8.275 0 -15.868 -1.784 -22.096 -5.31 c -6.227 -3.528 -11.88 -9.635 -11.88 -17.835 c 0 -1.182 0.13 -2.316 0.35 -3.41 a 79.073 79.073 0 0 1 -3.92 -0.416 l -4.805 28.825 h -47.25 L 227.57 253.9 c -1.305 0.168 -2.612 0.31 -3.92 0.415 c 0.22 1.094 0.35 2.228 0.35 3.41 c 0 8.2 -5.653 14.307 -11.88 17.834 c -6.23 3.526 -13.822 5.31 -22.097 5.31 c -8.274 0 -15.867 -1.784 -22.095 -5.31 c -6.228 -3.528 -11.88 -9.635 -11.88 -17.835 c 0 -6.295 3.335 -11.35 7.7 -14.96 c -7.5 -2.707 -15.132 -5.653 -22.95 -8.628 l 6.403 -16.824 c 30.86 11.744 55.79 21.082 77.396 18.736 l -2.414 -14.485 c -27.3 -1.767 -54.595 -5.664 -81.87 -11.71 Z m -36.177 6.512 c -0.22 0.01 -0.53 0.215 -0.754 0.254 c -9.218 30.762 -5.474 47.118 0.24 66.853 l 15.38 7.69 v -62.618 c -4.425 -6.463 -8.398 -9.97 -11.084 -11.224 c -1.486 -0.692 -2.616 -1.015 -3.78 -0.954 Z m 303.73 0 c -1.165 -0.06 -2.295 0.262 -3.78 0.955 c -2.687 1.254 -6.66 4.762 -11.085 11.225 v 62.618 l 15.38 -7.69 c 5.715 -19.735 9.458 -36.09 0.24 -66.853 c -0.226 -0.04 -0.535 -0.243 -0.755 -0.254 Z M 190.023 252.58 c -5.52 0 -10.413 1.38 -13.224 2.973 c -2.023 1.145 -2.54 1.945 -2.68 2.172 c 0.14 0.227 0.657 1.027 2.68 2.172 c 2.81 1.592 7.704 2.973 13.223 2.973 c 5.52 0 10.415 -1.38 13.227 -2.973 c 2.022 -1.145 2.538 -1.945 2.68 -2.172 c -0.142 -0.227 -0.658 -1.027 -2.68 -2.172 c -2.812 -1.592 -7.707 -2.972 -13.227 -2.972 Z m 15.907 5.145 c 0.055 0.09 0.07 0.11 0.07 0 s -0.015 -0.09 -0.07 0 Z m -31.81 0 c -0.056 -0.09 -0.07 -0.11 -0.07 0 s 0.014 0.09 0.07 0 Z m 147.857 -5.144 c -5.52 0 -10.415 1.38 -13.227 2.973 c -2.022 1.145 -2.538 1.945 -2.68 2.172 c 0.142 0.227 0.658 1.027 2.68 2.172 c 2.812 1.592 7.707 2.973 13.227 2.973 c 5.52 0 10.413 -1.38 13.224 -2.973 c 2.023 -1.145 2.54 -1.945 2.68 -2.172 c -0.14 -0.227 -0.657 -1.027 -2.68 -2.172 c -2.81 -1.592 -7.704 -2.972 -13.223 -2.972 Z m 15.904 5.145 c 0.056 0.09 0.07 0.11 0.07 0 s -0.014 -0.09 -0.07 0 Z m -31.81 0 c -0.055 -0.09 -0.07 -0.11 -0.07 0 s 0.015 0.09 0.07 0 Z m -91.07 32 h 18 s 0.124 6.12 3.05 11.975 c 2.927 5.853 6.95 11.025 19.95 11.025 s 17.023 -5.172 19.95 -11.025 c 2.926 -5.854 3.05 -11.975 3.05 -11.975 h 18 s 0.124 9.88 -4.95 20.026 c -5.073 10.147 -17.05 20.975 -36.05 20.975 c -19 0 -30.977 -10.828 -36.05 -20.974 c -5.074 -10.146 -4.95 -20.025 -4.95 -20.025 Z m 41 53.178 c 21.138 0 42.276 4.093 66.846 12.283 l -5.692 17.078 c -46.86 -15.62 -75.447 -15.62 -122.308 0 l -5.692 -17.078 c 24.57 -8.19 45.708 -12.283 66.846 -12.283 Z m -94.244 62.674 a 30.333 30.333 0 0 1 -1.297 1.53 c -5.123 5.61 -11.71 9.69 -19.056 13.228 c -14.692 7.073 -32.843 12.024 -50.558 17.93 c -17.716 5.904 -34.85 12.754 -46.82 22.064 c -9.73 7.565 -16.135 16.173 -18.22 28.395 H 173.81 c 12.59 -6.51 23.538 -11.936 30.553 -17.66 c 7.39 -6.03 10.754 -11.19 10.635 -21.232 l 18 -0.215 c 0.18 15.237 -7.198 27.185 -17.256 35.392 a 81.47 81.47 0 0 1 -4.953 3.715 h 90.42 a 81.47 81.47 0 0 1 -4.954 -3.715 c -10.058 -8.207 -17.436 -20.155 -17.256 -35.392 l 18 0.215 c -0.12 10.042 3.246 15.203 10.635 21.232 c 7.015 5.724 17.962 11.15 30.553 17.66 h 148.007 c -2.086 -12.222 -8.492 -20.83 -18.22 -28.396 c -11.97 -9.31 -29.105 -16.16 -46.82 -22.066 c -17.716 -5.905 -35.867 -10.856 -50.56 -17.93 c -7.345 -3.536 -13.932 -7.618 -19.054 -13.228 c -0.45 -0.493 -0.878 -1.006 -1.296 -1.53 c -5.047 3.394 -10.633 6.395 -16.783 8.958 c -19.572 8.155 -44.71 12.19 -77.46 12.19 c -32.75 0 -57.888 -4.035 -77.46 -12.19 c -6.15 -2.563 -11.737 -5.564 -16.784 -8.957 Z',
    3
);