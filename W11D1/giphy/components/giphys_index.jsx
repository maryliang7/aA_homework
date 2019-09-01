import React from 'react';

import GiphysIndexItem from './giphys_index_item';

export default class GiphysIndex extends React.Component {
    render () {
        console.log(this.props);
        return (
            <ul>
                {this.props.giphys.map(giphy => <span key={giphy.id}><GiphysIndexItem giphy={giphy} key={giphy.id} /></span>)}
            </ul>
        );
    };
}