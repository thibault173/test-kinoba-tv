require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import initFlatpickr from '../plugins/init_flatpickr.js'
import initMapbox from '../plugins/init_mapbox.js'

initFlatpickr()
initMapbox()

