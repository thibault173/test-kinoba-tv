require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import initSelect2 from '../plugins/init_select2.js'
import initFlatpickr from '../plugins/init_flatpickr.js'
import initMapbox from '../plugins/init_mapbox.js'

initSelect2()
initFlatpickr()
initMapbox()

