connection: "bq_synthetic"

include: "/views/synthdata.view.lkml"
include: "/dashboards/synthetic.dashboard.lookml"

datagroup: vendors_demo_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: vendors_demo_default_datagroup

explore: synthdata {}

map_layer: postal_codes_layer {
  format: topojson  # Assuming the file is in TopoJSON format
  feature_key: "postal_code"  # Key in the TopoJSON that identifies each feature
  property_key: "name"  # The property used for labeling the regions
  url: "https://raw.githubusercontent.com/wrenchchat/synthetic/c0bec97100196fcf8ba84d8587075c02d21e6258/maps/Postal_Codes_Map.topojson"
}
