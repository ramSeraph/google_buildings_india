#!/bin/bash

# steps involved in reproducing how the data in the repo has been obtained and processed

# 0. create data dir
mkdir data

# 1. get the india shape file
wget -O data/india-composite.geojson https://github.com/datameet/maps/blob/master/Country/india-composite.geojson

# 2. manually collect the s2 tiles that cover the india shape and write them to s2_tiles.txt
# TODO: this probably can be automated using s2 tools

# 3. download and convert data from each of the s2 tiles as seperate mbtiles files
pip install shapely==2.0.1
python process.py

# 4. join the individual mbtiles file into a single mbtiles file using tippecanoe( https://github.com/mapbox/tippecanoe )
tile-join -pk -o data/google-open-buildings-india.mbtiles  data/*.mbtiles
ls data/*.mbtiles | grep -v google | xargs rm 

# 5. split the mbtiles file into a mosaic of pmtiles files of size < 2 GB
python partition.py

# 6. push the pmtiles files github releases

# 7. start a fly server to expose the pmtiles files as a tileserver
