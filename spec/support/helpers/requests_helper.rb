def valid_list_json(type: "tasks", title:)
  {
    "data": [
      {
        "type": type,
        "attributes": {
          "title": title
        }
      }
    ]
  }
end

def valid_create_json(type: "tasks", title:)
  {
    "data": {
      "type": type,
      "attributes": {
        "title": title
      }
    }
  }
end
