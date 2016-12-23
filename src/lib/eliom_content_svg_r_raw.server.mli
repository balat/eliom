include
  Svg_sigs.T
  with type 'a Xml.W.t = 'a Eliom_shared.React.S.t
   and type 'a Xml.W.tlist = 'a Eliom_shared.ReactiveData.RList.t
   and type ('a, 'b) Xml.W.ft = unit -> ('a -> 'b) Eliom_shared.Value.t
   and type Xml.uri = Eliom_content_xml.Xml.uri
   and type Xml.event_handler =
         (Dom_html.event Js.t -> unit) Eliom_client_value.t
   and type Xml.mouse_event_handler =
         (Dom_html.mouseEvent Js.t -> unit) Eliom_client_value.t
   and type Xml.keyboard_event_handler =
         (Dom_html.keyboardEvent Js.t -> unit) Eliom_client_value.t
   and type Xml.elt = Eliom_content_xml.Xml.elt
   and type Xml.attrib = Eliom_content_xml.Xml.attrib
   and type 'a elt = 'a Eliom_content_svg_types.elt
   and type 'a attrib = 'a Eliom_content_svg_types.attrib