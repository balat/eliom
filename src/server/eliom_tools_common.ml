(* Ocsigen
 * Copyright (C) 2005 Vincent Balat
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *)


open Eliom_services

type ('a, 'b, 'c) one_page =
    (unit, unit,
     'a,
     [ `WithoutSuffix ],
     unit, unit,
     'b, 'c) service
    constraint 'c = [< Eliom_output.non_caml_service ]

type get_page =
    (Eliom_services.get_service_kind,
     Eliom_services.registrable,
     Eliom_output.non_caml_service) one_page
  (* constraint 'c = [  ] *)

let menu_class = "eliomtools_menu"
let last_class = "eliomtools_last"
let current_class = "eliomtools_current"
let current_path_class = "eliomtools_current_path"
let disabled_class = "eliomtools_disabled"
let first_class = "eliomtools_first"
let level_class = "eliomtools_level"

type ('a, 'b, 'c, 'd) hierarchical_site_item =
  | Disabled
  | Site_tree of ('a, 'b, 'c, 'd) hierarchical_site
  constraint 'c = [ Eliom_output.non_caml_service ]
and ('a, 'b, 'c) main_page =
  | Main_page of ('a, 'b, 'c) one_page
  | Default_page of ('a, 'b, 'c) one_page
  | Not_clickable
  constraint 'c = [ Eliom_output.non_caml_service ]
and ('a, 'b, 'c, 'd) hierarchical_site =
      (('a, 'b,  'c) main_page *
         ('d * ('a, 'b, 'c, 'd) hierarchical_site_item) list)
  constraint 'c = [ Eliom_output.non_caml_service ]

