class Seed
  def initialize
    build_companies("uncontacted", "MO", "St. Louis")
    build_companies("contacted", "CO", "Denver", 11)
    build_companies("confirmed", "KS", "Witchita", 21)
    build_companies("dead", "OK", "Oklahoma City", 31)
    build_pdf
    build_techhire_locations
    build_users
    build_pages
    build_content
  end

  def build_pdf
    pdf = Pdf.create(content_id: 5)
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

  def build_pages
    Page.create! do |page|
      page.name          = "Home"
      page.number_of_locations = 3
      page.template      = <<-HTML.strip_heredoc
        <div style="background-color:#F8EFE6;">
          <section class="mod-hero">
            $LOCATION1
            <p class="actions">
              <a href="/learn-more" class="button">Learn More</a>
              <a href="/signup" class="button">Sign Up</a>
            </p>
          </section>

          <section class="mod-stories layout-wrap">
            <div class="story">
              $LOCATION2
            </div>
            <div class="story">
              $LOCATION3
            </div>
          </section>

          <p class="finisher"><a href="/tools-resources">More stories about businesses that are implementing TechHire strategies</a>
        </div>
      HTML
    end

    Page.create! do |page|
      page.name          = "Tools and Resources"
      page.number_of_locations = 6
      page.template      = <<-HTML.strip_heredoc
        <div class="mod-heading tools">
          <h1>Tools/Resources</h1>
        </div>

        <div class="mod-content yellow">
          <div class="layout-wrap">
            <div class="three-columns">
              <div class="col icon-case">
                $LOCATION1
              </div>

              <div class="col icon-case">
                $LOCATION2
              </div>

              <div class="col icon-case">
                $LOCATION3
              </div>
            </div>
          </div>
        </div>

        <div class="mod-content">
          <div class="layout-wrap icon-case">
            <h2>Private Sector Tools</h2>
            <h3>Click a company to find out more about their commitment to TechHire.</h3>
            <div>
              <a href="#" class="content-dropdown-toggle" data-dd-target="#knack-content">
              <img src="assets/knack_logo.png" alt="knack" class="private-sector-tool-logo"/>
              </a>
            </div>
            <div>
              <a href="#" class="content-dropdown-toggle" data-dd-target="#bwd-content"><img src="assets/better_weekdays_logo.png" alt="better-weekdays" class="private-sector-tool-logo"/></a>
            </div>
            <div>
              <a href="#" class="content-dropdown-toggle" data-dd-target="#linkedin-content"><img src="assets/linkedin_logo.jpg" alt="linkedin" class="private-sector-tool-logo"/></a>
            </div>
            <div>
              <a href="#" class="content-dropdown-toggle" data-dd-target="#ceb-content"><img src="assets/ceb_logo.png" alt="ceb" class="private-sector-tool-logo"/></a>
            </div>


            <div class="col">
              <div class="content-dropdown" id="knack-content">
                <h3>Business Apps for TechHire Community Members</h3>
                <p>As a proud supporter of the White House TechHire initiative, <strong><a href="https://www.knack.it/" target="_blank">Knack</a></strong> made the commitment to provide the Knack Business App completely free to any employer, coding school, or community ready to identify, train, and hire job-seekers who are underrepresented in the tech field—minorities, women, veterans and economically and socially disadvantaged individuals—even if they have no higher education or work experience.</p>
                <div class="two-columns">
                  <div class="col">
                    <p>Knack makes smart mobile games that combine game theory, behavioral science, and proprietary big data algorithms to change the way people of all walks of life discover and broadcast their talents and tap into their potential.</p>
                    <p>Knack not only helps job-seekers pinpoint their "knacks"—their skills, abilities, and strengths—all from the way they play Knack's mobile games, but it also matches them with job opportunities tailored to one's potential for success on the job, aiming to replace the traditional credentials and job experience requirements that erect barriers for many high-potential, but low-credentialed individuals.</p>
                  </div>

                  <div class="col">
                    <p>Knack offers two apps:</p>

                    <ol class="bulleted">
                      <li><strong>What's Your Knack?</strong> uses smart mobile games to help job-seekers discover and broadcast their knacks and identify matching job opportunities based on their potential for success on the job.</li>
                      <li><strong>Knack Business App</strong> helps employers attract, engage and spot high-potential individuals who've got the knack to do the job—even if they don't have higher education credentials or job experience.</li>
                    </ol>

                    <p>Leading Fortune 500 employers in the US and around the world, and numerous small and medium size businesses in every industry, have adopted Knack and are on the path to changing the way they spot high-potential talent.</p>
                  </div>
                </div>
              </div>

            </div>
            <div class="col">
              <div class="content-dropdown" id="bwd-content">
                <h3>Career Management Platform for TechHire Community Members</h3>
                <p><strong><a href="http://www.betterweekdays.com/" target="_blank">Better Weekdays</a></strong> is a St. Louis based job-matching platform that helps universities improve job placement outcomes of its graduates, and companies to hire them based on job compatibility and culture fit.</p>
                <p>Better Weekdays has committed to providing its pay-walled web and mobile career management platform free of charge for colleges and universities, Local Leaders, and other partners in TechHire communities to leverage and facilitate connections between employers and job seekers.</p>
                <p>The service will feature a dashboard that connects job seekers to resources to prepare for gainful employment, and allows employers to showcase their brands in a meaningful way to aspiring employees.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="linkedin-content">
                <h3>Economic Analysis to Aid Career Development</h3>
                <p>
                <a href="http://linkedin.com" target="_blank">LinkedIn</a> will draw from its Economic Graph data and work with interested communities to 1) help job seekers decide where to focus their skills development, 2) assist community partners to focus on the jobs that are most in-demand, and to 3) identify the workforce gaps to prepare for future investments.
                </p>
                <p>
                This may also include working with partners to track the career outcome of bootcamp and accelerator graduates, and working on curriculum development.
                </p>
                <p>
                LinkedIn will also work in support of the TechHire initiative to find better ways to connect talent to training programs and job seekers to employers.
                </p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="ceb-content">
                <h3>Recruitment Guidance for Employers</h3>
                <p>
                <a href="http://www.executiveboard.com/" target="_blank">CEB</a> will develop their own best practices playbook for employers with CEB guidance to private and public employers on how to recruit tech talent from non-traditional sources.
                </p>
                <p>
                CEB will also provide free labor market snapshots from CEB Talent Neuron to select communities involved in the TechHire Initiative in order to surface job and skill segments where talent supply-demand gaps create opportunity for local workforce innovation.
                </p>
              </div>
            </div>
          </div>
        </div>

        <div class="mod-content yellow">
          <div class="layout-wrap icon-sheet">
            <div class="col">
              $LOCATION5
            </div>
          </div>
        </div>

        <div class="mod-content">
          <div class="layout-wrap">
            <div class="col">
              $LOCATION6
            </div>
          </div>
        </div>

      HTML
    end

    Page.create! do |page|
      page.name          = "Learn More"
      page.number_of_locations = 7
      page.template      = <<-HTML.strip_heredoc
        <div class="mod-heading learn">
          <h1>Learn More</h1>
        </div>
        <div class="layout-wrap">
          <div class="layout-callout">
            <div class="callout">
              <div class="embed-container">
                $LOCATION1
              </div>
            </div>
            $LOCATION2
          </div>
        </div>
        <div class="mod-content">
          <div class="layout-wrap icon-check">
            <div class="col">
              $LOCATION3
            </div>
          </div>
        </div>
        <div class="mod-content">
          <div class="layout-wrap">
            <h2>Find Out How Much Your Open Positions Are Costing You</h2>
            <form id="rate-calculator">
              <p>
                <span class="leading-dollar"> $ </span>
                <span class="calc-group">
                  <label for="calculator_rate">Daily Rate:</label>
                  <input type="text" name="calculator[rate]" class="calc-input calc-rate" value="434">
                </span>

                <span> X </span>

                <span class="calc-group">
                  <label for="calculator_positions"># of Open Positions:</label>
                  <input type="text" name="calculator[positions]" class="calc-input calc-positions" value="1">
                </span>

                <span> X </span>

                <span class="calc-group">
                  <label for="calculator_positions"># of Days Unfilled:</label>
                  <input type="text" name="calculator[days]" class="calc-input calc-days" value="1">
                </span>

                <span> = </span>

                <span class="calc-group">
                  <label for="calculator_total">Total Cost:</label>
                  <input type="text" name="calculator[days]" class="calc-total" readonly value="$434.00">
                </span>
              </p>
              <small>Source: CEB Corporate Leadership Council</small>
            </form>
          </div>
        </div>

        <div class="mod-content yellow">
          <div class="layout-wrap icon-check">
            $LOCATION4
            <div class="two-columns">
              <div class="col icon-playbook">
                $LOCATION5
              </div>

              <div class="col icon-sheet">
                $LOCATION6
              </div>
            </div>
          </div>
        </div>

        <div class="mod-content">
          <div class="layout-wrap">
              <div class="col">
                <a href="http://www.opportunityatwork.org" target="_blank">
                <img src="assets/oatw_logo.png" alt="OppLogo" style="display: inline-block; float: left; padding: 20px;"></a>
                <div stlye="display: inline-block; float: left;">
                  $LOCATION7
                </div>
              </div>
          </div>
        </div>

      HTML
    end

    Page.create! do |page|
      page.name          = "TechHire Locations"
      page.number_of_locations = 5
      page.template      = <<-HTML.strip_heredoc
        <div class="mod-heading location">
          $LOCATION1
        </div>
        <div class="mod-map layout-wrap">
          $LOCATION2
          $LOCATION3
          $LOCATION4
          $LOCATION5
        </div>
      HTML
    end

  end

  def build_content
    # ==== Build Home Page Content ====
    Content.create! page_id: Page.find_by(name: "Home").id, location: 1, body: <<-HTML.strip_heredoc
        <h1>￼Connecting Businesses, Communities and the Tech Talent Pipeline</h1>
      HTML

    Content.create! page_id: Page.find_by(name: "Home").id, location: 2, body: <<-HTML.strip_heredoc
        <h1>How Monsanto is doing it</h1>
        <div class="embed-container">
          <iframe src="https://player.vimeo.com/video/126637482" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="https://vimeo.com/126637482" target="_blank">Kara, Marquis and Caleb @ Monsanto</a> from <a href="https://vimeo.com/user32162469" target="_blank">LaunchCode</a> on <a href="https://vimeo.com" target="_blank">Vimeo</a>.</p>
        </div>
      HTML

    Content.create! page_id: Page.find_by(name: "Home").id, location: 3, body: <<-HTML.strip_heredoc
        <h1>How Capital One is doing it</h1>
        <div class="embed-container">
          <iframe width="560" height="315" src="https://www.youtube.com/embed/85hEQF2GkyE" frameborder="0" allowfullscreen></iframe>
        </div>
        <p>&nbsp;</p>
      HTML
    # ==== END ====

    # ==== Build Learn More Page Content ====
    Content.create! page_id: Page.find_by(name: "Learn More").id, location: 1, body: <<-HTML.strip_heredoc
        <iframe frameborder="0" src="https://www.youtube-nocookie.com/embed/3iiXLXo2hic?rel=0&amp;showinfo=0"></iframe>
      HTML

    Content.create! page_id: Page.find_by(name: "Learn More").id, location: 2, body: <<-HTML.strip_heredoc
         <p>
          Beginning with the 21 communities of the TechHire initiative – announced by President Obama in March 2015 – which today represent over 130,000 open IT jobs, Opportunity<span class="opportunity-at">@</span>Work will work with a range of technology, private sector, and philanthropic partners to create freely available tools to streamline the sign-up and participation of thousands of employers in inclusive hiring, and to facilitate a nationwide learning network to rapidly improve the impact of TechHire. Over 300 employers have already signed on.
        </p>
        <p>
          The 21 TechHire communities are committed to taking action – working with each other, employers, training institutions, and other partners – to create a better marketplace for IT jobs. TechHire communities – including cities, small states, and rural areas - have announced plans to work together in new ways to recruit and place applicants based on their actual skills and to create more fast track tech training opportunities, based on market-wide hiring needs.
        </p>
        <p>
          TechHire communities will build a talent pipeline by leveraging their 4-year universities and community colleges, but will also leverage non-traditional approaches, including hiring on-ramps for people with the skills but not the pedigree to be hired in traditional ways, accelerated coding “boot camps,” and high-quality online courses that prepare workers for well-paying IT jobs, often in just a few months.
        </p>
        <p>
          The long-term objective of TechHire is to create the labor market conditions nationally that enable employers to "hire when ready" and job seekers to be aware of, prepare for, and connect with IT jobs and careers. By creating compelling proof points in communities throughout the country; uncovering common challenges; developing scalable solutions; and bringing to bear national and regional partnerships and resources, TechHire, with support from Opportunity<span class="opportunity-at">@</span>Work, will serve as a catalyst to transforming the broader labor market.
        </p>
      HTML

    Content.create! page_id: Page.find_by(name: "Learn More").id, location: 3, body: <<-HTML.strip_heredoc
        <h2>The Case for Businesses</h2>
        <p>Meaningful work is essential to human flourishing and to America’s promise of upward mobility and civic equality, while tapping the full talents of our people is essential for productive and inclusive economic growth. The gradual erosion of such work for many in the US economy over the past 30 years threatens both America’s promise and economic vitality.</p>
        <p>Every day that goes by without filling an open position costs a business $434 on average. This number is likely higher for IT jobs which take an average of 95 business days to fill - higher than the overall average. Committing to TechHire means access to an expanded hiring pool with qualified candidates who are ready to work, but may have previously been overlooked.</p>
      HTML

    Content.create! page_id: Page.find_by(name: "Learn More").id, location: 4, body: <<-HTML.strip_heredoc
        <h2>Rethinking the “Skills Gap” as a Labor Market Failure: Need and the Opportunity</h2>
        <p>
          With over 5 million open jobs in the United States—the highest level in at least 15 years—how can so many American workers find themselves stuck, without a path to well-paid employment?
        </p>
        <p>
          Nearly half of U.S. employers report difficulty in hiring employees who have the skills their companies need to compete, a figure consistent with employer surveys over the last two business cycles.
        </p>
        <p>
          Yet, since 2000, real wages for the median worker have stagnated and voluntary job changes – i.e., quitting a job to take or seek a better (usually higher-paying) one – are down by 28 percent. This seems like a confounding paradox, but a few U.S. statistics offer some clues as to the underlying causes:
        </p>
      HTML

    Content.create! page_id: Page.find_by(name: "Learn More").id, location: 5, body: <<-HTML.strip_heredoc
        <h2>U.S. Job Openings by the Numbers</h2>
        <ul class="bulleted">

          U.S. Job Openings by the Numbers

          <li>
            While only 19 percent of administrative assistants have four-year college degrees, 65 percent of new assistant job postings require a four-year degree just to be considered. (Burning Glass)
          </li>

          <li>
            Employers are only half as likely to grant an interview to a job candidate unemployed for over 6 months, compared to someone more recently employed with identical education, skills and experience. Yet, a study of 20,000 hires found that this distinction made no difference in likely job performance. (Evolv)
          </li>

          <li>
            Less educated workers report being only half as likely to receive valuable on-the-job training from their employers as did workers with more formal education. (OECD)
          </li>
        </ul>
      HTML

    Content.create! page_id: Page.find_by(name: "Learn More").id, location: 6, body: <<-HTML.strip_heredoc
        <h2>Underlying Issues</h2>
        <p>
          What these dysfunctions all have in common is an origin on the “demand” side of the U.S. labor market – how employers recruit, hire, train, and promote. Yet most interventions that aim to improve employment outcomes focus purely on the “supply side”— education and job training. These efforts are important, but they can’t “close the skills gap” without demand-side reforms. We need smarter, more inclusive employer practices and the partnerships and public policies to support them.
          Employers are experiencing a classic market failure, in which screening, hiring, and training practices are inadvertently limiting the collective talent pipeline and creating “skills mismatches” with economy-wide ripple effects. As an illustration of how costly this is for employers, consider the following back-of-the-envelope estimate. An open job costs $434 each day in lost productivity and sales (CEB) – considerably more in high-value fields such as IT, where jobs pay 76 percent above average (BLS).
          The average time to fill an open IT job nearly doubled from 43 to 76 days in the past 5 years. With nearly 600,000 open IT jobs now – just 12 percent of total open jobs – and a million more projected in the next few years, just shrinking average time-to-fill IT jobs back to 2010 levels is worth around $40 billion annually to US employers: double what’s spent on all federal job training programs.
        </p>
      HTML

    Content.create! page_id: Page.find_by(name: "Learn More").id, location: 7, body: <<-HTML.strip_heredoc
        <p>
        Opportunity<span class="opportunity-at">@</span>Work is a civic enterprise whose mission is to re-wire the U.S. labor market to enable more Americans to achieve upward mobility in the job market and workplace, to facilitate actions by U.S. employers to develop the talent they collectively need to succeed and grow, and to scale up innovations that unlock more fully all people’s potential for higher-value, meaningful work as a source of economic opportunity and national competitive advantage.
        </p>
        <p>You can also read more about TechHire by visiting the <a href="https://www.whitehouse.gov/issues/technology/techhire">White House page</a>.</p>
      HTML
    # ==== END ====

    # ==== Build Tools/Resources Page Content ====
    Content.create! page_id: Page.find_by(name: "Tools and Resources").id, location: 1, body: <<-HTML.strip_heredoc
        <h2>Case Study: Xpanxion</h2>
        <p>
          Xpanxion is an enterprise software consulting firm with locations in smaller towns throughout
          the United States. In order to maintain offices outside of traditional tech centers, Xpanxion has invested
          heavily in training and career development, resulting in a strong supply of quality, local talent.
          <a href="/case_studies/xpanxion">Read about Xpanxion's training strategy.</a>
        </p>
      HTML

    Content.create! page_id: Page.find_by(name: "Tools and Resources").id, location: 2, body: <<-HTML.strip_heredoc
        <h2>Case Study: Capital One</h2>
        <p>
          To expand the tech talent pipeline, Capital One has committed to a hiring approach that requires demonstrated
          skill for virtually all coding and programming jobs. Capital One is hiring thousands of new technology and digital roles.
        </p>

        <p>
          <a href="case_studies/capital_one">See how Capital One helped Eric and Cory.</a>
        </p>
      HTML

    Content.create! page_id: Page.find_by(name: "Tools and Resources").id, location: 3, body: <<-HTML.strip_heredoc
        <h2>Case Study: Rural Sourcing Inc. (RSI)</h2>
        <p>
          Rural Sourcing is a software consultancy committed to solving the "outsourcing crisis" by bringing
          tech jobs back to American communities. RSI helps give tech employees the flexibility to live where
          they want while also making investments back into local economies.
          <a href="case_studies/rural_sourcing">Read about RSI's talent sourcing strategy.</a>
        </p>
      HTML

    Content.create! page_id: Page.find_by(name: "Tools and Resources").id, location: 4, body: <<-HTML.strip_heredoc
        <h1>Not yet set</h1>
      HTML

    Content.create! page_id: Page.find_by(name: "Tools and Resources").id, location: 5, body: <<-HTML.strip_heredoc
        <h2>Fact Sheet</h2>
        <p>On March 9, 2015, President Obama announced the creation of the TechHire initiative — a new campaign to work with communities to get more Americans rapidly trained for well-paying technology jobs.</p>
        <p><a href="https://www.whitehouse.gov/the-press-office/2015/03/09/fact-sheet-president-obama-launches-new-techhire-initiative" class="button" target="_blank">Download the Factsheet</a></p>
      HTML

    Content.create! page_id: Page.find_by(name: "Tools and Resources").id, location: 6, body: <<-HTML.strip_heredoc
        <h2>Opportunity<span class="opportunity-at">@</span>Work is currently working with partners to develop access to resources that serve the following functions for employers:</h2>
        <ul class="bulleted">
          <li>Understanding of what characteristics predict success for a hire</li>
          <li>Access to a broader, more diverse pool of candidates</li>
          <li>Longer-term, dynamic pipeline planning</li>
          <li>Ability to select best candidates – including non-traditional and internal</li>
          <li>Ability to support any new hire in new role</li>
        </ul>
        <h3>We are still developing new partnerships related to these functions. Please <a href="/signup">be in touch</a> if you are interested in learning more.</h3>
      HTML
    # ==== END ====

    # ==== Build TechHire Page Content ====
    Content.create! page_id: Page.find_by(name: "TechHire Locations").id, location: 1, body: <<-HTML.strip_heredoc
        <h1>Where Is TechHire</h1>
      HTML

    Content.create! page_id: Page.find_by(name: "TechHire Locations").id, location: 2, body: <<-HTML.strip_heredoc
        <h2>Where TechHire is Now</h2>
        <iframe width="100%" height="600" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//www.arcgis.com/apps/MapSeries/index.html?appid=d20555036a54406f859a99e8d094fe70"></iframe>
      HTML

    Content.create! page_id: Page.find_by(name: "TechHire Locations").id, location: 3, body: <<-HTML.strip_heredoc
        <h2>The TechHire Opportunity</h2>
        <p>President Obama has issued a call to action for more communities across the country to join the movement and create TechHire partnerships, and employers in communities all across the country are in critical need of more talent with IT skills. The interactive map below provides a picture of the TechHire opportunity -- it shows real-time the open IT jobs across the U.S.. Gaining an understanding of these  job openings and the specific skills required will be a key step for new communities developing TechHire partnerships.</p>
        <p>Click into a state to see where technology jobs are currently being advertised, represented by a pin in each local market. As you click into each pin, you will be able to browse available technology job listings in a particular community.</p>
      HTML

    Content.create! page_id: Page.find_by(name: "TechHire Locations").id, location: 4, body: <<-HTML.strip_heredoc
        <iframe src="https://www.glassdoor.com/Job/explorer/embed.htm?jobCat1=29" height="720" width="100%"></iframe>
      HTML

    Content.create! page_id: Page.find_by(name: "TechHire Locations").id, location: 5, body: <<-HTML.strip_heredoc
        <p>Open jobs data is provided by Glassdoor, Inc. which aggregates millions of U.S. job listings from a variety of online sources, including hiring employers and job boards as well as other online sources. Data is updated several times per day.</p>
      HTML
    # ==== END ====
  end

  def build_users
    User.create(email: "admin@gmail.com", name: "admin", password: "password", role: 1)
    User.create(email: "tim@gmail.com", name: "Tim", title: "title", password: "password", role: 0)
    User.create(email: "marissa@gmail.com", name: "Marissa", title: "jobs", password: "password", role: 0)
    User.create(email: "josh@gmail.com", name: "JOSH", title: "teacher", password: "password", role: 0)
    User.create(email: "mike@gmail.com", name: "Mike", title: "teacher", password: "password", role: 0)
    User.create(email: "horace@gmail.com", name: "Horace", title: "teacher", password: "password", role: 0)
    User.create(email: "jeff@gmail.com", name: "Jeff", title: "teacher",password: "password", role: 0)
  end
end
Seed.new
