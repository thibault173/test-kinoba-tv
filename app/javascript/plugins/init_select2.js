import $ from 'jquery'
import 'select2'
import 'select2/dist/css/select2.min.css'

const initSelect2 = () => {
  const selectAncestor = document.querySelector('#select2-ancestor')

  if (selectAncestor) {
    $('#select2-ancestor').select2()
  }
}

export default initSelect2
