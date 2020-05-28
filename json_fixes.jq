def construct_date:
    # Fix up the timestamp format and change to canonical form:
    {
        "$date": (. | sub(" "; "T") + "Z")
    };

def point($lon; $lat):
    # Convert the provided lon-lat values to a point subdocument:
    {
        "type": "Point",
        "coordinates": [$lon, $lat]
    };

def station($id; $name; $lon; $lat):
    # Convert the provided values into a custom 'station' subdocument:
    {
        "id": $id,
        "name": $name,
        "location": point($lon; $lat)
    };

._id |= (input_filename | split("/")[-1])   # Add an _id value from the current filename
| .starttime |= construct_date              # Convert starttime to canonical form
| .stoptime |= construct_date               # Convert endtime to canonical form
# Remodel start station data:
| .startstation += station(.["start station id"]; .["start station name"]; .["start station longitude"]; .["start station latitude"])
# Remodel end station data:
| .endstation += station(.["end station id"]; .["end station name"]; .["end station longitude"]; .["end station latitude"])
# Delete all the fields that are no longer needed:
| del(.["start station id"])
| del(.["start station name"])
| del(.["start station longitude"])
| del(.["start station latitude"])
| del(.["end station id"])
| del(.["end station name"])
| del(.["end station longitude"])
| del(.["end station latitude"])