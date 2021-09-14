from flask import jsonify
from datetime import date
import calendar


def getValue(request):
    my_date = date.today()
    day = calendar.day_name[my_date.weekday()]    
    return jsonify({"dayOfTheWeek":day}), 200

