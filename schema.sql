CREATE TABLE asn_names(
  "asn" INTEGER,
  "name" TEXT
);
CREATE TABLE asn(
  "registry" TEXT,
  "cc" TEXT,
  "type" TEXT,
  "start" INTEGER,
  "value" TEXT,
  "date" TEXT,
  "status" TEXT,
  "reg_id" TEXT
);
CREATE TABLE ipv4(
  "registry" TEXT,
  "cc" TEXT,
  "type" TEXT,
  "start" TEXT,
  "value" TEXT,
  "date" TEXT,
  "status" TEXT,
  "reg_id" TEXT,
  "dec_start" INTEGER,
  "dec_end" INTEGER
);
CREATE TABLE routeviews_ipv4(
  "cidr" TEXT,
  "aspath" TEXT,
  "as1" INTEGER,
  "asN" INTEGER,
  "dec_start" INTEGER,
  "dec_end" INTEGER,
  "dec_width" INTEGER
);
