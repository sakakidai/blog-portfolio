import React from "react"
import PropTypes from "prop-types"
import { SketchPicker } from 'react-color'

class Colorpicker extends React.Component {

  constructor(props) {
    super(props)
    this.state = {selector: props.selector}
    this.handleChange = this.handleChange.bind(this)
  }

  handleChange = (color) => {
    document.body.style.color = color.hex
    let elem = document.getElementById(this.state.selector)
    elem.value = color.hex
  }

  render () {
    return (
      <React.Fragment>
        return <SketchPicker
          color={ this.props.color }
          onChange={ this.handleChange } />
      </React.Fragment>
    )
  }
}

export default Colorpicker
