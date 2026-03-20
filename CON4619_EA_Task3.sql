Create Table tutorial.hong_kong_locations (
id serial PRIMARY KEY,
name VARCHAR(255),
geom geometry(Point, 4326)
);

INSERT INTO tutorial.hong_kong_locations (name, geom) VALUES
('West Kowloon' , ST_SetSRID(ST_MakePoint(114.15558182327548, 22.29893364856476), 4326)),
('Star Ferry Pier' , ST_SetSRID(ST_MakePoint(114.16868041260312, 22.2937650325536), 4326)),
('Avenue of Stars' , ST_SetSRID(ST_MakePoint(114.17418087086672, 22.293004143662994), 4326)),
('Waterfront Park' , ST_SetSRID(ST_MakePoint(114.18037614204272, 22.298933952471298), 4326));

CREATE TABLE tutorial.hong_kong_locations_buffers (
id serial PRIMARY KEY,
geom geometry(Polygon, 4326)
);

INSERT INTO tutorial.hong_kong_locations_buffers (geom)
SELECT ST_Transform(ST_Buffer(ST_Transform(geom, 3857), 500), 4326)
FROM tutorial.hong_kong_locations;


