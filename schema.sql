CREATE TABLE asn_names(
  "asn" INTEGER PRIMARY KEY,
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
CREATE TABLE caida_rv2_pfx2as(
  "cidr" TEXT,
  "asn" INTEGER,
  "dec_start" INTEGER,
  "dec_end" INTEGER,
  "dec_width" INTEGER,
  PRIMARY KEY (dec_start,dec_end)
);
CREATE INDEX idx_ipdec ON caida_rv2_pfx2as (dec_start,dec_end);
CREATE INDEX idx_ipdecas ON caida_rv2_pfx2as (dec_start,dec_end,asn);
CREATE INDEX idx_asn ON asn (asn);
