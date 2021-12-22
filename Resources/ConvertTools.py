from datetime import datetime
from robot.api.deco import keyword
import pytz

@keyword('Convert Timestamp To Time')
def convert_timestamp_to_time(timestamp):
    # Convert timestamp to the next format "08:23am" in London timezone
    london_timezone = pytz.timezone('Europe/London')
    date = datetime.utcfromtimestamp(timestamp).replace(tzinfo=london_timezone)
    formatted_datetime = date.strftime("%I:%M%p").lower()
    return formatted_datetime

my_list = [0, 1, 2, 3, 4]
print(my_list[-2])

