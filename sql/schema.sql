CREATE TABLE IF NOT EXISTS family (
    family_name text PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS genus (
    genus_family text NOT NULL REFERENCES family (family_name),
    genus_name text PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS species (
    species_genus text NOT NULL REFERENCES genus (genus_name),
    species_name text PRIMARY KEY
);
