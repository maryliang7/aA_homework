import React from 'react';
import GiphysIndex from './giphys_index';


export default class GiphysSearch extends React.Component {
    constructor() {
        super()
        this.state = {
            searchTerm: ""
        }
        this.handleInput = this.handleInput.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInput(e) {
        this.setState({searchTerm: e.target.value})
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.fetchSearchGiphys(this.state.searchTerm);
    }
    
    render() {
        console.log(this.props);
        console.log(this.state);

        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <input onChange={this.handleInput} type="text" />
                    <input type="submit" value="Search!"/>
                </form>
                <GiphysIndex giphys={this.props.giphys}/>
            </div>
        );
    }
}
