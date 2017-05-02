// const Game = require('../node_solution/game.js');
class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents(event) {
    let t = event.currentTarget;
    let pos = $(t).attr("pos").split(",").map((el) => parseInt(el));
    // console.log(pos);
    if (this.game.isOver()) {
      if (this.game.winner()) {
        alert(`${this.game.currentPlayer} has won!`);
      } else {
        alert(`NO ONE WINS!`);
      }
    } else {
      if (this.game.board.isEmptyPos(pos)) {
        this.game.playMove(pos);
        let mark = this.game.currentPlayer;
        // console.log(mark);
        if (mark === 'x') {
          $(t).addClass("playerX");
        } else {
          $(t).addClass("playerO");
        }
        $(t).text(mark);
        $(t).css('background-color', 'white');
      } else {
        alert('Is not valid position!');
      }
    }

  }
  // Function.prototype.myBind = function(context) {
  //   let that = this;
  //   let arg = Array.from(arguments).slice(1);
  //
  //   return function() {
  //
  //   }
  // }

  makeMove($square) {}

  setupBoard() {
    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      const $row = $("<ul>").addClass("group");
      for (var colIdx = 0; colIdx < 3; colIdx++) {
        const $col = $("<li>").addClass("square").attr("pos", [rowIdx, colIdx]);
        $col.on("click", (event)=> {
        this.bindEvents(event);
        });
        $row.append($col);
      }
      this.$el.append($row);
    }
  }
}

module.exports = View;
