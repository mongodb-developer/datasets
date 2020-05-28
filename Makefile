all: one_big_list.json file_per_row/.generated without_header_row.csv

one_big_list.json: 201912-citibike-tripdata-subset.csv scripts/csv_to_json
	./scripts/csv_to_json 201912-citibike-tripdata-subset.csv one_big_list.json

file_per_row:
	mkdir file_per_row

file_per_row/.generated: file_per_row one_big_list.json scripts/separate_docs
	./scripts/separate_docs one_big_list.json file_per_row
	date > file_per_row/.generated

without_header_row.csv: 201912-citibike-tripdata-subset.csv
	tail -n +2 201912-citibike-tripdata-subset.csv > without_header_row.csv

clean:
	rm -rf one_big_list.json file_per_row

.PHONY: all clean