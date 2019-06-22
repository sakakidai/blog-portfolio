import React from "react"
import PropTypes from "prop-types"
var classNames = require('classnames');

class Favarite extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
      favarite: props.favarite,
      blog_favarite_count: props.blog_favarite_count,
      loading: false
    }
  }

  favarite = () => {

    this.setState({
      loading: true,
      blog_favarite_count: ++this.state.blog_favarite_count
    })

    $.ajax({
      type: 'POST',
      url: `/blogs/${this.props.blog.id}/favarites`,
      dataType: 'json',
      contentType: 'application/json',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      }
    }).then((response) => {
      const favarite = response
      this.setState({
        loading: false,
        favarite
      })
    })

  }

  unfavarite = () => {

    this.setState({
      loading: true,
      blog_favarite_count: --this.state.blog_favarite_count
    })

    $.ajax({
      type: 'DELETE',
      url: `/blogs/${this.props.blog.id}/favarites`,
      dataType: 'json',
      contentType: 'application/json',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      }
    }).then((response) => {
      this.setState({
        loading: false,
        favarite: null
      })
    })

  }

  render () {
    const isFavariting = this.state.favarite !== null
    const isCount = this.state.blog_favarite_count
    const className = classNames("btn", {
      'btn-outline': isFavariting,
      'btn-outline': !isFavariting
    })

    const icon_btn = {
      cursor: "pointer"
    }

    return (
      <React.Fragment>
        <span 
          // className={ className }
          onClick={ isFavariting ? this.unfavarite : this.favarite } 
          disabled={ this.state.loading } 
          style={ icon_btn }
        >
          { isFavariting ? 
            <i className="fas fa-heart"></i> : 
            <i className="far fa-heart"></i> 
          } : { isCount } いいね！！
        </span>
      </React.Fragment>
    );
  }
}

Favarite.propTypes = {
  favarite: null
}

Favarite.propTypes = {
  blog: PropTypes.object.isRequired,
  favarite: PropTypes.object,
  blog_favarite_count: PropTypes.number
};

export default Favarite
