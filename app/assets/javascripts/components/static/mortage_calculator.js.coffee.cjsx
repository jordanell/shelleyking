@MortgageCalculator = React.createClass
  displayName: "MortgageCalculator"

  getInitialState: ->
    purchase: 300000
    interest: 5
    term:     25
    down:     50000
    interval: "weekly"

  componentDidMount: ->
    # Ensure the select is initialized
    initializeSelects()

    $(".select-options li").on "click", @handleIntervalChange

  componentWillUnmount: ->
    $(".select-options li").off "click", @handleIntervalChange

  isNumber: (value) ->
    value = parseFloat(value)

    return !_.isNaN(value)

  getFactor: ->
    factor =
      switch @state.interval
        when "weekly" then 52
        when "bi-weekly" then 26
        when "semi-monthly" then 24
        when "monthly" then 12
        else 12

  calculateLoanAmount: ->
    return 0 unless @isNumber(@state.purchase) and @isNumber(@state.down)

    @state.purchase - @state.down

  calculateMonthlyPayment: ->
    return 0 unless @isNumber(@state.interest) and @isNumber(@state.term)

    factor = @getFactor()
    interest = parseFloat(@state.interest) || 0

    rate = interest / 100 / factor
    numberOfPayments = factor * @state.term

    @calculateLoanAmount() * rate * (Math.pow(1 + rate, numberOfPayments)) / (Math.pow(1 + rate, numberOfPayments) - 1)

  calculateTotalPayments: ->
    return 0 unless @isNumber(@state.term)

    factor = @getFactor()

    factor * @state.term

  calculateTotalAmountPaid: ->
    return 0 unless @isNumber(@state.term)

    factor = @getFactor()

    @calculateMonthlyPayment() * factor * @state.term

  calculateTotalInterestPaid: ->
    return 0 unless @isNumber(@state.term) and @isNumber(@state.purchase) and @isNumber(@state.down)

    @calculateTotalAmountPaid() - @calculateLoanAmount()

  handleSubmit: (e) ->
    e.preventDefault()

    $('html, body').animate({
        scrollTop: $(".results").offset().top
    }, 1500);

  handleNumericChange: (e) ->
    key = $(e.target).attr("class")
    value = $(e.target).val()

    newState = {}
    newState[key] = value

    @setState newState

  handleIntervalChange: (e) ->
    value = $(e.target).attr('rel')

    @setState interval: value

  renderForm: ->
    <form onSubmit={ @handleSubmit }>
      <div className="container">
        <div className="form-left-container">
          <div className="input">
            <label>Purchase Amount:</label>
            <input type="text" className="purchase" name="purchase" value={ @state.purchase } onChange={ @handleNumericChange }></input>
          </div>

          <div className="input">
            <label>Interest Rate:</label>
            <input type="text" className="interest" name="interest" value={ @state.interest } onChange={ @handleNumericChange }></input>
          </div>

          <div className="input">
            <label>Mortgage Term (years):</label>
            <input type="text" className="term" name="term" value={ @state.term } onChange={ @handleNumericChange }></input>
          </div>
        </div>

        <div className="form-right-container">
          <div className="input">
            <label>Down Payment:</label>
            <input type="text" className="down" name="down" value={ @state.down } onChange={ @handleNumericChange }></input>
          </div>

          <div className="input">
            <label>Payment Interval:</label>
            <select onChange={ @handleIntervalChange }>
              <option value="weekly">Weekly</option>
              <option value="bi-weekly">Bi-Weekly</option>
              <option value="semi-monthly">Semi-Monthly</option>
              <option value="monthly">Monthly</option>
            </select>
          </div>
        </div>
      </div>

      <div className="center calculate-container">
        <button className="blue">
          Calculate
        </button>
      </div>
    </form>

  renderInterestRate: ->
    return "0.00%" unless @isNumber(@state.interest)

    numeral(@state.interest / 100).format("0.00%")

  renderResults: ->
    <div className="container results">
      <div className="results-left-container">
        <table className="results-table">
          <tbody>
            <tr>
              <td>Loan Amount:</td>
              <td>{ numeral(@calculateLoanAmount()).format("$ 0,0[.]00") }</td>
            </tr>
            <tr>
              <td>Interest Rate:</td>
              <td>{ @renderInterestRate() }</td>
            </tr>
            <tr>
              <td>Payment Inteval:</td>
              <td>{ @state.interval }</td>
            </tr>
            <tr>
              <td>Mortgage Term:</td>
              <td>{ @state.term } years</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div className="results-right-container">
        <table className="results-table">
          <tbody>
            <tr>
              <td>Payment:</td>
              <td>{ numeral(@calculateMonthlyPayment()).format("$ 0,0[.]00") }</td>
            </tr>
            <tr>
              <td>Total Payments:</td>
              <td>{ @calculateTotalPayments() }</td>
            </tr>
            <tr>
              <td>Total Amount Paid:</td>
              <td>{ numeral(@calculateTotalAmountPaid()).format("$ 0,0[.]00") }</td>
            </tr>
            <tr>
              <td>Total Interest Paid:</td>
              <td>{ numeral(@calculateTotalInterestPaid()).format("$ 0,0[.]00") }</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

  render: ->
    <section className="react-mortgage-calculator">
      { @renderForm() }
      <hr />
      { @renderResults() }
    </section>
