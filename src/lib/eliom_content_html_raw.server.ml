type +'a elt = Eliom_content_xml.Xml.elt
type +'a attrib = Eliom_content_xml.Xml.attrib

module type RAW =
  Html_sigs.T
  with type 'a Xml.W.t = 'a
   and type 'a Xml.W.tlist = 'a list
   and type ('a,'b) Xml.W.ft = 'a -> 'b
   and type Xml.uri = Eliom_content_xml.Xml.uri
   and type Xml.event_handler =
         (Dom_html.event Js.t -> unit) Eliom_client_value.t
   and type Xml.mouse_event_handler =
         (Dom_html.mouseEvent Js.t -> unit) Eliom_client_value.t
   and type Xml.keyboard_event_handler =
         (Dom_html.keyboardEvent Js.t -> unit) Eliom_client_value.t
   and type Xml.elt = Eliom_content_xml.Xml.elt
   and type Xml.attrib = Eliom_content_xml.Xml.attrib
   and type 'a elt = 'a elt
   and type 'a attrib = 'a attrib
   and module Svg := Eliom_content_svg_raw.F

module F = Html_f.Make(Eliom_content_xml.Xml)(Eliom_content_svg_raw.F)

(* This is [Eliom_content.Xml] adapted such that request nodes are produced *)
module Xml' = struct
  include Eliom_content_xml.Xml

  let make elt = make_request_node (make elt)
  let make_lazy elt = make_request_node (make_lazy elt)

  let empty () = make Empty

  let comment c = make (Comment c)
  let pcdata d = make (PCDATA d)
  let encodedpcdata d = make (EncodedPCDATA d)
  let entity e = make (Entity e)

  let leaf ?(a = []) name =  make (Leaf (name, a))
  let node ?(a = []) name children = make (Node (name, a, children))
  let lazy_node ?(a = []) name children =
    make_lazy (Eliom_lazy.from_fun (fun () -> (Node (name, a, Eliom_lazy.force children))))

end

module D = Html_f.Make(Xml')(Eliom_content_svg_raw.D)

module R = Eliom_shared_content.Html.R(Eliom_content_svg_raw.R)
