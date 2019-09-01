import React from 'react';

// DOESNT KEEP TRACK OF STATE --> USE PURE FUNCTION

// export default class GiphysIndexItem extends React.Component {
//     render() {
//         console.log(this.props);
//         return (
//             <img src={this.props.giphy.images.fixed_height.url} />
//         );
//     };
// }

const GiphysIndexItem = ({ giphy }) => {
    return (
        <img src={giphy.images.fixed_height.url} />
    );
}

export default GiphysIndexItem;