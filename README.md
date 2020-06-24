# MongoImport Sample Data

This repository provides a small sample of [Citibike System Data](https://www.citibikenyc.com/system-data).
It's designed to demonstrate the different options available in `mongoimport`.
The data is provided in both its original form and translated into JSON and other forms.
An [accompanying blog post](https://developer.mongodb.com/how-to/mongoimport-guide) describes how to import each form into MongoDB.

## Breakdown

The main components are as follows:

| File/Folder | Purpose |
| - | - |
| 201912-citibike-tripdata-subset.csv | The first 10k rows of original data. |
| one_big_list.json | A single JSON document containing all the data from `201912-citibike-tripdata-subset.csv` converted to JSON, with some minor cleanup.
| file_per_row | The data from `one_big_list.json`, split into 9999 separate files, one per document. |
| without_header_row.csv | A copy of `201912-citibike-tripdata-subset.csv`, but without the header row. |

## Development

The original data file was derived by calling `head -n 10000` on the original source file, downloaded from [Citibike System Data](https://www.citibikenyc.com/system-data). This results in a CSV file consisting of a header row and 9999 records.

The other files are generated using the Python scripts found in the `scripts` directory, which is usually run from the `Makefile` at the top level. Users of this data shouldn't need to worry about any of this, but the scripts may be of some use to people building their own simple data cleanup scripts.

## Data

The data in this repository was sourced from Citibike System Data for the month of December 2019.

* Data Source: [Citibike System Data](https://www.citibikenyc.com/system-data)
* License: [NYCBS Data Use Policy](https://www.citibikenyc.com/data-sharing-policy)
