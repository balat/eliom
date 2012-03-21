(* Ocsigen
 * http://www.ocsigen.org
 * Module eliom_sessions.ml
 * Copyright (C) 2009 Vincent Balat
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

let get_default_hostname ?sp () = Url.Current.host
let get_default_port ?sp () = 80 (*VVV take from server? !!!!!!!!! *) (*RRR ??? Url.default_http_port ???*)
let get_default_sslport ?sp () = 443 (*VVV take from server? !!!!!!!!! *) (*RRR ??? replace by Url.default_https_port ???*)
let get_default_links_xhr ?sp () = true (*BBB take from server? !!!!!!!!!! *)

let debug_timings = ref false
