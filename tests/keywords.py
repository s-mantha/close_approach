import json
from robot.api.deco import keyword


@keyword("Response Data")
def response_data(response=None):
    response = {
    "signature":{"source" : "NASA/JPL SBDB Close Approach Data API","version" : "1.3"},
    "count":"3",
    "fields":["des","orbit_id","jd","cd","dist","dist_min","dist_max","v_rel","v_inf","t_sigma_f","h","diameter","diameter_sigma","fullname"],
    "data":[
        ["153814","174","2461948.724524223","2028-Jun-26 05:23","0.00166253924938707","0.00166237672775144","0.00166270177137481","10.2426019613426","10.084918538826","< 00:01","18.33","0.932","0.011","153814 (2001 WN5)"],
        ["99942","206","2462240.407091595","2029-Apr-13 21:46","0.000254099098170977","0.000254085852623379","0.000254112343772133","7.42249308586014","5.84135545611464","< 00:01","19.7","0.34","0.04"," 99942 Apophis (2004 MN4)"],
        ["2001 AV43","42","2462452.142037054","2029-Nov-11 15:25","0.00209271674918052","0.00209125158265035","0.00209418316351851","3.99789389003422","3.66561381185116","00:03","24.6",null,null,"  (2001 AV43)"]
    ]
}
    return json.loads(response)

@keyword("Get City Name")
def get_city_name(response_text):
    data = json.loads(response_text)
    try:
        ret = data["name"]
    except KeyError:
        ret = "city not found"
    return ret

@keyword("Get City Latitude")
def get_city_latitude(response_text):
    data = json.loads(response_text)
    try:
        ret = data["coord"]["lat"]
    except KeyError:
        ret = "latitude not found"
    return ret

@keyword("Get City Longitude")
def get_city_longitude(response_text):
    data = json.loads(response_text)
    try:
        ret = data["coord"]["lon"]
    except KeyError:
        ret = "longitude not found"
    return ret

@keyword('Get Metadata Content')
def get_metadata_content(property_text,response_text):
    data = json.loads(response_text)
    try:
        ret = data[property_text]

    except KeyError:
        ret = property_text + "not found"
    return ret

@keyword('Get Metadata Content Nested List')
def get_metadata_content_nested_list(property_text,response_text,value,sub_value):
    data = json.loads(response_text)
    try:
        ret = data[property_text][int(value)][int(value)]

    except KeyError:
        ret = property_text + "not found"
    return ret


@keyword('Get Metadata Content Nested Dict')
def get_metadata_content_nested_dict(property_text,response_text,value):
    data = json.loads(response_text)
    try:
        ret = data[property_text][value]

    except KeyError:
        ret = property_text + "not found"
    return ret

@keyword("Get List Value")
def get_list_value(property_text,response_text,position):
    data = json.loads(response_text)
    try:
        ret= data[property_text][int(position)]
    except KeyError:
        ret =  property_text + "not found"
    return ret

