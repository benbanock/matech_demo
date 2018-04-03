import $ from 'jquery';
import {slider} from 'bootstrap-slider';
import 'bootstrap-slider/dist/css/bootstrap-slider.css';

$('#ex20a').on('click', function(e) {
      $('#ex20a')
          .parent()
          .find(' >.well')
          .toggle()
          .find('input')
          .slider('relayout');
      e.preventDefault();
  });

