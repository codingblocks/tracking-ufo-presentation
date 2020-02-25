DROP TABLE IF EXISTS cluster_config;
INSERT INTO cluster_config (cluster_id, name, config) VALUES 
('e0a11707-a77b-4abd-ae23-7b5af92046e5', 'local cluster', 'application.id=grafka
group.id=grafka
bootstrap.servers=kafka1:19092

key.serializer=org.apache.kafka.common.serialization.StringSerializer
value.serializer=org.apache.kafka.common.serialization.StringSerializer

key.deserializer=org.apache.kafka.common.serialization.StringDeserializer
value.deserializer=org.apache.kafka.common.serialization.StringDeserializer')

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
    'GiAlienBug',
    'M256 32.796c-29.75 0-68.891 11.577-99.588 28.844-15.348 8.633-28.61 18.674-37.685 28.884C109.65 100.735 105 110.796 105 119.796c0 1 .75 3.54 3.62 7.164 2.867 3.623 7.55 8.046 13.503 12.809 11.906 9.524 28.805 20.496 46.87 32.539 31.444 20.963 66.69 44.82 87.007 74.048 20.317-29.229 55.563-53.085 87.008-74.048 18.064-12.043 34.963-23.015 46.869-32.54 5.953-4.762 10.636-9.185 13.504-12.808 2.868-3.623 3.619-6.164 3.619-7.164 0-9-4.65-19.06-13.727-29.272-9.076-10.21-22.337-20.251-37.685-28.884C324.89 44.373 285.75 32.796 256 32.796zm-96 55c16 0 80 48 80 80-49.427-32.146-80-32-80-32-16-16-16-48 0-48zm192 0c16 0 16 32 0 48 0 0-30.573-.146-80 32 0-32 64-80 80-80zM124.389 216.099c-1.259 0-2.503.037-3.73.107-.326.019-.644.055-.968.078 4.622 3.44 8.605 7.731 11.797 12.52 7.195 10.792 10.748 24.327 8.934 37.931-1.338 10.032-5.833 20.055-13.715 28.377 1.736 1.92 3.344 4.07 4.99 6.438 7.078 10.176 14.145 24.717 21.242 41.256 1.2 2.797 2.396 5.651 3.586 8.54 10.648-6.648 22.597-10.931 35.457-10.529 1.92.06 3.862.224 5.82.5 12.583 1.776 25.386 7.956 38.677 19.051a288.157 288.157 0 0 0 3.953-6.65c-4.372-16.06-11.582-34.608-20.555-52.612-18.748-37.617-46.579-72.377-66.69-79.558-10.431-3.725-19.989-5.453-28.798-5.45zm263.222 0c-8.81-.004-18.367 1.724-28.798 5.449-20.111 7.18-47.942 41.941-66.69 79.558-8.973 18.004-16.183 36.551-20.555 52.612 1.26 2.194 2.591 4.42 3.953 6.65 13.29-11.095 26.094-17.275 38.676-19.05 1.96-.277 3.9-.44 5.82-.5 12.86-.403 24.81 3.88 35.458 10.529 1.19-2.89 2.385-5.744 3.586-8.541 7.097-16.54 14.164-31.08 21.242-41.256 1.646-2.367 3.254-4.517 4.99-6.438-7.882-8.322-12.377-18.345-13.715-28.377-1.814-13.604 1.739-27.14 8.934-37.931 3.192-4.789 7.175-9.08 11.797-12.52-.324-.023-.642-.06-.967-.078a65.622 65.622 0 0 0-3.73-.107zm-293.047 9.718a23.893 23.893 0 0 0-4.12.39c-4.146 2.676-8.089 5.835-11.856 9.425-19.142 18.24-32.817 48.68-38.734 82.889-5.918 34.207-4.163 72.009 5.894 104.39 6.921 22.286 17.755 41.725 32.348 56.293-7.482-25.49-12.588-54.061-12.727-82.312-.192-39.136 9.156-78.077 36.291-105.371 1.569-1.578 3.7-2.926 6.031-3.694 9.491-6.578 13.73-14.786 14.887-23.47 1.186-8.896-1.261-18.361-6.066-25.569-4.806-7.208-11.614-11.916-19.076-12.805-.933-.11-1.89-.169-2.872-.166zm322.872 0a23.654 23.654 0 0 0-2.872.166c-7.462.889-14.27 5.597-19.076 12.805-4.805 7.208-7.252 16.673-6.066 25.568 1.158 8.685 5.396 16.893 14.887 23.471 2.331.768 4.462 2.116 6.03 3.694 27.136 27.294 36.484 66.235 36.292 105.37-.14 28.252-5.245 56.823-12.727 82.313 14.593-14.568 25.427-34.007 32.348-56.293 10.057-32.381 11.812-70.183 5.894-104.39-5.917-34.208-19.592-64.65-38.734-82.89-3.767-3.589-7.71-6.748-11.855-9.425a23.856 23.856 0 0 0-4.121-.389zM223.54 236.642l-4.668 25.673c6.142 9.82 11.863 20.228 17.113 30.762 8.339 16.73 15.233 33.836 20.012 49.658 4.78-15.822 11.678-32.928 20.016-49.658 5.25-10.534 10.971-20.943 17.113-30.762l-4.668-25.673c-10.553 10.212-19.153 20.668-24.408 31.18L256 283.92l-8.05-16.1c-5.256-10.511-13.856-20.967-24.409-31.18zM189.412 358.77c-.642.01-1.283.039-1.92.084-7.645.535-14.922 3.493-22.58 8.482-18.513 12.06-29.046 29.471-33.531 52.262-3.334 16.942-3.043 36.818.517 58.691 7.15-14.08 14.765-30.503 22.176-44.867 5.776-11.194 11.273-20.973 17.479-27.951 3.103-3.49 6.382-6.572 11.355-8.092 4.974-1.52 11.702.299 15.455 4.053l15.117 15.117c2.063-2.118 5.486-7.853 8.249-14.299 4.073-9.506 6.651-18.326 8.09-23.52-13.398-12.427-24.835-18.221-34.532-19.59a37.478 37.478 0 0 0-5.875-.37zm133.176 0a37.478 37.478 0 0 0-5.875.37c-9.697 1.369-21.134 7.163-34.531 19.59 1.438 5.194 4.016 14.014 8.09 23.52 2.762 6.446 6.185 12.18 8.248 14.299l15.117-15.117c3.753-3.754 10.481-5.573 15.455-4.053 4.973 1.52 8.252 4.603 11.355 8.092 6.206 6.978 11.703 16.757 17.479 27.95 7.411 14.365 15.026 30.789 22.176 44.868 3.56-21.873 3.851-41.75.517-58.691-4.485-22.791-15.018-40.203-33.531-52.262-7.658-4.989-14.935-7.947-22.58-8.483a36.203 36.203 0 0 0-1.92-.084zM256 362.726a300.28 300.28 0 0 1-6.125 10.216l.092.092-1.237 4.945s-4.051 16.411-10.459 31.362c-3.203 7.475-6.71 14.621-12.158 20.068-2.723 2.724-6.272 5.322-11.15 5.863-4.878.542-10-1.787-13.326-5.113l-3.2-3.199c-3.24 1.637-6.565 2.987-9.988 3.953a44.166 44.166 0 0 0 2.783 4.275c4.507 6.084 11.133 13.22 18.694 19.834 15.12 13.231 34.574 23.774 46.074 23.774s30.953-10.543 46.074-23.774c7.56-6.615 14.187-13.75 18.694-19.834a44.166 44.166 0 0 0 2.783-4.275c-3.423-.966-6.748-2.316-9.989-3.953l-3.199 3.2c-3.326 3.325-8.448 5.654-13.326 5.112-4.878-.541-8.427-3.14-11.15-5.863-5.447-5.447-8.955-12.593-12.158-20.068-6.408-14.951-10.46-31.362-10.46-31.362l-1.236-4.945.092-.092A300.28 300.28 0 0 1 256 362.726z',
    3
);

update alien_types
set severity = 3
where alien_type_id = 1