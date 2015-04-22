$().ready(function() {
  $('.signup').validate({
    rules: {
      name: {
        required: true,
        minlength: 2
      },
      organization: "required",
      title: "required",
      state: "required",
      city: "required",
      email: {
        required: true,
        email: true
      },
      hiring: "required",
      hire_count: {
        required: "#company_hiring:checked"
      }
    },
    messages: {
      name: {
        required: "Please enter your name.",
        minlength: "Your name must consist of at least 2 characters."
      },
      organization: "Please enter your company's name.",
      title: "Please enter your position/title.",
      state: "Please select a state.",
      city: "Please select a city.",
      hiring: "Please check this box to commit to hiring TechHire",
      hire_count: "How many people are you pledging to hire?"
    }
  })
});
