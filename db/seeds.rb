class Seed
  def initialize
    build_companies("uncontacted", "MO", "St. Louis")
    build_companies("contacted", "CO", "Denver", 11)
    build_companies("confirmed", "KS", "Witchita", 21)
    build_companies("dead", "OK", "Oklahoma City", 31)
    build_pdf
    build_techhire_locations
    build_pdfs
    build_users
    build_content
  end

  def build_pdf
    pdf = Pdf.create(slot: 1)
    pdf.pdf_file = File.open("public/assets/pdfs/sample_pdf.pdf")
    pdf.save
  end

  def build_techhire_locations
    TechhireLocation.create(
      city: "Louisville",
      state: "Kentucky"
    )

    TechhireLocation.create(
      city: "New York City",
      state: "New York"
    )

    TechhireLocation.create(
      city: "Philadelphia",
      state: "Pennsylvania"
    )

    TechhireLocation.create(
      city: "Louisville",
      state: "Kentucky"
    )

    TechhireLocation.create(
      city: "City of Kearney and Buffalo County",
      state: "Kentucky"
    )

    TechhireLocation.create(
      city: "St. Louis",
      state: "Missouri"
    )

    TechhireLocation.create(
      city: "Salt Lake City",
      state: "Utah"
    )

    TechhireLocation.create(
      city: "San Antonio",
      state: "Texas"
    )

    TechhireLocation.create(
      city: "Los Angeles",
      state: "California"
    )

    TechhireLocation.create(
      city: "Minneapolis",
      state: "Minnesota"
    )

    TechhireLocation.create(
      city: "Kansas City",
      state: "Kansas"
    )

    TechhireLocation.create(
      city: "Memphis",
      state: "Tennessee"
    )

    TechhireLocation.create(
      city: "City of Kearney and Buffalo County",
      state: "Kentucky"
    )

    TechhireLocation.create(
      city: "Eastern Kentucky",
      state: "Kentucky"
    )

    TechhireLocation.create(
      city: "Nashville",
      state: "Tennessee"
    )

    TechhireLocation.create(
      city: "Rochester",
      state: "New York"
    )

    TechhireLocation.create(
      city: "Detroit",
      state: "Michigan"
    )

    TechhireLocation.create(
      city: "City of Kearney and Buffalo County",
      state: "Kentucky"
    )

    TechhireLocation.create(
      city: "San Francisco",
      state: "California"
    )

    TechhireLocation.create(
      city: "Albuquerque",
      state: "New Mexico"
    )

    TechhireLocation.create(
      city: "Chattanooga",
      state: "Tennessee"
    )

    TechhireLocation.create(
      city: "Portland",
      state: "Oregon"
    )

    TechhireLocation.create(
      city: "Dover",
      state: "Delaware"
    )

    TechhireLocation.create(
      city: "Anchorage",
      state: "Alaska"
    )
  end

  #Companies
  def build_companies(status, state, city, offset=1)
    10.times do |iteration|
     i = iteration + offset
      Company.create(
        name: "user#{i}",
        organization: "company#{i}",
        title: "head person#{i}",
        state: state,
        city: city,
        zip_code: "80013",
        email: "user#{i}@email.com",
        hiring: 1,
        hire_count: 5,
        status: status
      )
    end
  end

  # Pdfs
  def build_pdfs
    pdf = Pdf.create(slot: 1)
    pdf.pdf_file = File.open("public/assets/pdfs/sample_pdf.pdf")
    pdf.save
  end

  def build_users
    User.create(email: "admin@gmail.com", password: "password", role: 1)
  end

  def build_content
    3.times do |x|
      Content.create(title: "Some descriptive title",
                      body: "Body of text",
                      page: "learn more",
                      slot: x + 1)
    end

    20.times do
      Content.create(title:Faker::Lorem::sentence(3), body: Faker::Lorem.sentence(3))
    end
  end
end
Seed.new
