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

  getFactor: ->
    factor =
      switch @state.interval
        when "weekly" then 52
        when "bi-weekly" then 26
        when "semi-monthly" then 24
        when "monthly" then 12
        else 12

  calculateLoanAmount: ->
    @state.purchase - @state.down

  calculateMonthlyPayment: ->
    factor = @getFactor()
    interest = parseFloat(@state.interest) || 0

    rate = interest / 100 / factor
    numberOfPayments = factor * @state.term

    @calculateLoanAmount() * rate * (Math.pow(1 + rate, numberOfPayments)) / (Math.pow(1 + rate, numberOfPayments) - 1)

  calculateTotalPayments: ->
    factor = @getFactor()

    factor * @state.term

  calculateTotalAmountPaid: ->
    factor = @getFactor()

    @calculateMonthlyPayment() * factor * @state.term

  calculateTotalInterestPaid: ->
    @calculateTotalAmountPaid() - @calculateLoanAmount()

  handleSubmit: (e) ->
    e.preventDefault()

    $('html, body').animate({
        scrollTop: $(".results").offset().top
    }, 1500);

  handleNumericChange: (e, formatted = true) ->
    key = $(e.target).attr("class")
    value = $(e.target).val()

    if formatted
      value = 0 unless value
      value = 0 if value < 0

      value = numeral().unformat("#{value}")

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
            <input type="text" className="purchase" value={ numeral(@state.purchase).format("$ 0,0[.]00" ) } onChange={ @handleNumericChange }></input>
          </div>

          <div className="input">
            <label>Interest Rate:</label>
            <input type="text" className="interest" value={ @state.interest } onChange={ _.partial(@handleNumericChange, _, false) }></input>
          </div>

          <div className="input">
            <label>Mortgage Term (years):</label>
            <input type="text" className="term" value={ @state.term } onChange={ _.partial(@handleNumericChange, _, false) }></input>
          </div>
        </div>

        <div className="form-right-container">
          <div className="input">
            <label>Down Payment:</label>
            <input type="text" className="down" value={ numeral(@state.down).format("$ 0,0[.]00" ) } onChange={ @handleNumericChange }></input>
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
              <td>{ numeral(@state.interest / 100).format("0.00%") }</td>
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
