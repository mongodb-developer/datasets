all: one_big_list.json file_per_document/.generated without_header_row.csv

one_big_list.json: 201912-citibike-tripdata-subset.csv scripts/csv_to_json
	./scripts/csv_to_json 201912-citibike-tripdata-subset.csv one_big_list.json

file_per_document:
	mkdir file_per_document

file_per_document/.generated: file_per_document one_big_list.json scripts/separate_docs
	./scripts/separate_docs one_big_list.json file_per_document
	date > file_per_document/.generated

without_header_row.csv: 201912-citibike-tripdata-subset.csv
	tail -n +2 201912-citibike-tripdata-subset.csv > without_header_row.csv

clean:
	rm -rf one_big_list.json file_per_document

.PHONY: all clean