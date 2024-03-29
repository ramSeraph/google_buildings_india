
Data is available in [Releases](https://github.com/ramSeraph/google_buildings_india/releases/tag/GOBI-latest)

Can be downloaded to a local mbtiles file by running the following commands

```
pip install pmtiles==3.2.0 mercantile==1.2.1 requests==2.30.0
python download_as_mbtiles.py
```
Data is also available as mvt tiles at -
```
https://indianopenmaps.fly.dev/google-buildings/{z}/{x}/{y}.pbf
```

The data can be viewed online at https://indianopenmaps.fly.dev/google-buildings/view

Steps to reproduce what was done to get data in the current format are documented in `steps.sh`

Sample working deployment is in the `infra` folder. But the current deployment is at [indianopenmaps](https://github.com/ramSeraph/indianopenmaps)

Source: https://sites.research.google/open-buildings/

Changes Made: converted to pmtiles format, a tiny bit of data has been dropped( around 15% of 4 z14 tiles ) and some generalizations were applied at lower zoom levels.

LICENSE: one of [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/), [ODbL 1.0](https://opendatacommons.org/licenses/odbl/1-0/) 
