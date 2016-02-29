class Seed
  def initialize
    # build_users
    build_pages
    build_pdf
    build_content
  end

  def build_pages
    Page.create_with( number_of_locations: 3,
                      template: <<-HTML.strip_heredoc
        <div style="background-color:#F8EFE6;">
          <section class="mod-hero">
            $LOCATION1
            <p class="actions">
              <a href="/learn_more" class="button">Learn More</a>
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

          <p class="finisher"><a href="/tools_resources/#case-studies">More stories about businesses that are implementing TechHire strategies</a><br/><br/>
          <div class="layout-wrap" style="padding-left: 0px;padding-right: 0px;">
            <iframe width="1000" height="600" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.arcgis.com/apps/MapJournal/index.html?appid=ef3a5773f73e4487976dadb24fc45576&folderid=ff312344dc8a4b0099e78d3a62c0879b"></iframe>
          </div>
        </div>
      HTML
    ).find_or_create_by(name: "Home")

    Page.create_with( number_of_locations: 7, navigation: true,
                      template: <<-HTML.strip_heredoc
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
              <p>
                Beginning with the 21 communities of the TechHire initiative – announced by President Obama in March 2015 – which today represent over 130,000 open IT jobs, Opportunity<span class="opportunity-at">@</span>Work will work with a range of technology, private sector, and philanthropic partners to create freely available tools to streamline the sign-up and participation of thousands of employers in inclusive hiring, and to facilitate a nationwide learning network to rapidly improve the impact of TechHire. Over 300 employers have already signed on.
              </p>
              <p>
                The 35 TechHire communities are committed to taking action – working with each other, employers, training institutions, and other partners – to create a better marketplace for IT jobs. TechHire communities – including cities, small states, and rural areas - have announced plans to work together in new ways to recruit and place applicants based on their actual skills and to create more fast track tech training opportunities, based on market-wide hiring needs.
              </p>
              <p>
                TechHire communities will build a talent pipeline by leveraging their 4-year universities and community colleges, but will also leverage non-traditional approaches, including hiring on-ramps for people with the skills but not the pedigree to be hired in traditional ways, accelerated coding “boot camps,” and high-quality online courses that prepare workers for well-paying IT jobs, often in just a few months.
              </p>
              <p>
                The long-term objective of TechHire is to create the labor market conditions nationally that enable employers to "hire when ready" and job seekers to be aware of, prepare for, and connect with IT jobs and careers. By creating compelling proof points in communities throughout the country; uncovering common challenges; developing scalable solutions; and bringing to bear national and regional partnerships and resources, TechHire, with support from Opportunity<span class="opportunity-at">@</span>Work, will serve as a catalyst to transforming the broader labor market.
              </p>
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
                  <input type="text" name="calculator[rate]" class="calc-input calc-rate" value="407">
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
                  <input type="text" name="calculator[days]" class="calc-total" readonly value="$407.00">
                </span>
              </p>
              <small>Source: CEB Corporate Leadership Council</small>
            </form>
          </div>
        </div>

        <div class="mod-content yellow">
          <div class="layout-wrap icon-check">
            $LOCATION4
            <div class="three-columns">
              <div class="col icon-playbook">

                <h2>Self-defeating Employer Practices</h2>
                <ul class="bulleted">
                  <li>
                    <b>Creeping credentialism:</b> 19% of administrative assistants have a four-year college degree but 65% of new assistant jobs require it
                  </li>

                  <li>
                    <b>Bias in hiring:</b> 45% lower callback rate for LTU versus recently employed despite identical education, skills and experience and evidence of no difference in job performance
                  </li>
                </ul>
              </div>

              <div class="col icon-sheet">
                <h2>Poor Coordination, Information, and Access</h2>
                <ul class="bulleted">
                  <li>
                    <b>No clear path to jobs:</b> educational institutions and training programs are unclear about industry needs for specific jobs
                  </li>

                  <li>
                    <b>Barriers to awareness and access:</b> students, workers and job-seekers don’t know which choices make them attractive and/or can’t access these pathways
                  </li>
                </ul>
              </div>

              <div class="col icon-sheet">
                <h2>Lack of Replication and Scale</h2>
                <ul class="bulleted">
                  <li>
                    <b>Scale is elusive:</b> there are pockets of success but scale remains too slow, costly and complex – as each one invents or re-invents its own approach
                  </li>

                  <li>
                    <b>Inefficient resource allocation:</b> limited data and no marketplace to evaluate what is and is not working
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <div class="mod-content">
          <div class="layout-wrap">
              <div class="row">
                <div class="col-sm-5">
                  <a href="http://www.opportunityatwork.org" target="_blank">
                    <span class="oatw-logo"></span>
                  </a>
                </div>
                <div class="col-sm-7" stlye="display: inline-block; float: left;">
                  $LOCATION7
                </div>
              </div>
          </div>
        </div>

      HTML
    ).find_or_create_by(name: "Learn More")

    Page.create_with(number_of_locations: 4, navigation: true,
                    template: <<-HTML.strip_heredoc
        <div class="mod-heading location">
          <h1>Where is TechHire?</h1>
        </div>
        <div class="mod-map layout-wrap">
          $LOCATION1
          $LOCATION2
          $LOCATION3
          $LOCATION4
        </div>
      HTML
    ).find_or_create_by(name: "TechHire Locations")

    Page.create_with(number_of_locations: 9, navigation: true,
                     template: <<-HTML.strip_heredoc
        <div class="mod-heading tools">
          <h1>Tools/Resources</h1>
        </div>

        <div class="text-center">
          <a href="http://s3.amazonaws.com/whitehousetechhire2/public/assets/pdfs/EmployerPlaybook.pdf?1442252349" target="_blank">
            <span class="employer-playbook"></span>
          </a><br/>
        </div>

        <div class="mod-content yellow">
          <a name="case-studies"></a>
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
            <h3>The following organizations are partnering with Opportunity@Work to support TechHire communities, to enable more employers to recruit and place applicants based on their skills and to increase access to accelerated training opportunities.</h3>

            <table>
              <tr>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#knack-content">
                      <span class="knack-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#bwd-content">
                      <span class="better_weekdays-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#linkedin-content">
                      <span class="linkedin-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#ceb-content">
                      <span class="ceb-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#code-content">
                      <span class="code-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#codecademy-content">
                      <span class="codecademy-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#coursera-content">
                      <span class="coursera-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#devbootcamp-content">
                      <span class="devbootcamp-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#flatiron_school-content">
                      <span class="flatiron_school-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#general_assembly-content">
                      <span class="general_assembly-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#glassdoor-content">
                      <span class="glassdoor-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#hack_reactor-content">
                      <span class="hack_reactor-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#microsoft-content">
                      <span class="microsoft-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#rural_sourcing-content">
                      <span class="rural_sourcing-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#treehouse-content">
                      <span class="treehouse-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#udacity-content">
                      <span class="udacity-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#yeswecode-content">
                      <span class="yeswecode-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#capital_one-content">
                      <span class="capital_one-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#cisco-content">
                      <span class="cisco-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#edx-content">
                      <span class="edx-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#galvanize-content">
                      <span class="galvanize-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#hackbright_academy-content">
                      <span class="hackbright_academy-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#sabio-content">
                      <span class="sabio-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
                <td>
                  <div>
                    <a href="#" class="content-dropdown-toggle" data-dd-target="#year_up-content">
                      <span class="year_up-logo private-sector-tool-logo"></span>
                    </a>
                  </div>
                </td>
              </tr>
            </table>

            <div class="col">
              <div class="content-dropdown" id="knack-content">
                $LOCATION4
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="bwd-content">
                $LOCATION5
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="linkedin-content">
                $LOCATION6
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="ceb-content">
                $LOCATION7
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="code-content">
                <h3></h3>
                <p><strong><a href="https://code.org/" target="_blank">Code.org</a></strong>, a nonprofit dedicated to expanding computer science education, will commit to include and promote a JavaScript tutorial in the 2015 Hour of Code campaign, to introduce millions of students of all ages (including adults) to JavaScript, the professional computer programming language that works on the broadest set of software and computing platforms.</p>
                <p>Code.org will also highlight the TechHire communities and their partner training institutions in its web map of locations that is used by prospective students to identify coding bootcamps.</p>
                <p>The data powering this map will be available as an open database for any organization to use.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="codecademy-content">
                <h3></h3>
                <p><strong><a href="https://www.codecademy.com/" target="_blank">Codeacademy</a></strong>, a company that provides a free platform for individuals to develop employable programming skills, will host in-person meet-ups for 600 students from disadvantaged women and minority groups over a period of 12 months.</p>
                <p>At each meet-up, expert staff from Codecademy will teach students how they can benefit from programming skills, provide an overview of popular coding skills, and provide attendees with guidance on resources to pursue technical job opportunities.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="coursera-content">
                <h3></h3>
                <p>In partnership with the Department of Veteran Affairs (VA), the online education platform <strong><a href="https://www.coursera.org/" target="_blank">Coursera</a></strong> will offer every Veteran one free course certificate in a career-relevant course, such as data science or cybersecurity, that can be accessed online or at any one of the 27 in-person VA Learning Hubs that will launch this year in partnership with the American Red Cross and The Mission Continues.</p>
                <p>Learning Hubs combine the breadth and depth of Coursera’s online academic programs with the experience of having in-person Red Cross facilitators guide students through the curricula.</p>
                <p>The first Learning Hubs in Colorado Springs, Kansas City, New York City, Buffalo, and Honolulu will begin in August 2015.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="devbootcamp-content">
                <h3></h3>
                <p><strong><a href="http://devbootcamp.com/" target="_blank">Dev Bootcamp</a></strong>, a pioneer in short-term training that turns beginners into highly employable web developers, is donating $425,000 in tuition over the next year to get more women and underrepresented minorities into technology jobs.</p>
                <p>This will reduce the cost of tuition for Dev Bootcamp training from approximately $13,000 to $1,000 – enabling more people to develop the skills needed to access well-paying careers in tech and more companies to benefit from the perspectives generated by a more diverse talent pool.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="flatiron_school-content">
                <h3></h3>
                <p><strong><a href="http://flatironschool.com/" target="_blank">The Flatiron School</a></strong>, which trains people for jobs as software engineers and has over 99% job placement, is committing to provide technical assistance to local governments interested in increasing access to technical training to underrepresented groups in technology.</p>
                <p>In partnership with the City of New York, Flatiron School runs the NYC Web Development Fellowship, which trains 18-26 year olds without college degrees, and places them in roles averaging over $70,000 average salaries.</p>
                <p>Flatiron will work with partners to share expertise relating to program and curriculum design, student and instructor selection, and employer partnerships to increase access to training and ensure successful job placement amongst diverse communities.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="general_assembly-content">
                <h3></h3>
                <p><strong><a href="https://generalassemb.ly/" target="_blank">General Assembly</a></strong>, a global educational institution offering training in technology, business, and design, has committed to taking the following actions by the end of 2015: Engage broadly and inclusively with community colleges, training providers, and employers with the aim of collaborating to further standardize web development training and pilot an online web development program with at least one community college system; educate at least 100 people through its Opportunity Fund, a philanthropic fellowship program that provides hands-on education, mentorship, and career opportunities to underrepresented women, people of color, veterans, and low-income individuals nationwide; and roll out an entry-level analytics curriculum for which scholarships will be available.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="glassdoor-content">
                <h3></h3>
                <p><strong><a href="http://www.glassdoor.com/" target="_blank">Glassdoor</a></strong>, job and career marketplace that helps connect job seekers with employers, has developed a map-based tool for job seekers to search for open technology jobs.</p>
                <p>The company has also committed to providing interested communities adopting TechHire strategies with technical assistance to develop and publish interactive Glassdoor jobs data maps on their own websites to help local job seekers find available job opportunities.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="hack_reactor-content">
                <h3></h3>
                <p><strong><a href="http://www.hackreactor.com/" target="_blank">Hack Reactor</a></strong>, a California-based collective of both in-person and online programming schools that graduates over 1,000 software engineers annually, has committed to engage with TechHire communities to open new programming schools across America.</p>
                <p>Their first campus, in Oakland, California, will open in the summer of 2015.</p>
                <p>Hack Reactor will engage with qualified communities to devise risk sharing, scholarships, and need-blind admissions systems to maximize the economic impact and opportunity for underrepresented communities and individuals.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="microsoft-content">
                <h3></h3>
                <p>In support of the TechHire Initiative, <strong><a href="http://www.microsoft.com/" target="_blank">Microsoft</a></strong> will pilot an intensive and scalable Tech Jobs Academy to equip young adult learners with in-demand skills free of charge in order for them to obtain high-quality jobs and launch long-lasting careers in technology.</p>
                <p>This will build on Microsoft’s IT Academy, through which Microsoft is involved in 18 statewide public-private partnerships with 5,581 schools and community colleges taking advantage of IT Academy for technical skills development and career readiness.</p>
                <p>Microsoft is also partnering with Year Up in 2015 to provide 20 paid internships at its global headquarters and will offer additional paid internships to multiple coding bootcamp participants from disadvantaged backgrounds.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="rural_sourcing-content">
                <h3></h3>
                <p><strong><a href="http://www.ruralsourcing.com/" target="_blank">Rural Sourcing Inc. (RSI)</a></strong>, a firm focused on Domestic IT Outsourcing, will partner with interested rural communities to share free resources on: university partnerships, hiring practices, aptitude tests, and on the job training through internships and subsequent employment.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="treehouse-content">
                <h3></h3>
                <p><strong><a href="https://teamtreehouse.com/" target="_blank">Treehouse</a></strong> provides online training that aims to teach students job-ready training skills within 6-12 months.</p>
                <p>Over the next year, for each Employer Partnership made by Treehouse, they will provide a matching Treehouse membership to a nonprofit free of charge, targeting organizations serving populations that may not have access to traditional technology education.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="udacity-content">
                <h3></h3>
                <p><strong><a href="https://www.udacity.com/" target="_blank">Udacity</a></strong>, an online education company that focuses on teaching individuals the technical skills they need to secure new jobs or advance their careers, has committed to 5,000 scholarships in its Nanodegree program for veterans, minorities, and other underserved students.</p>
                <p>Udacity will be matching these scholarships 1:1 together with leading tech employers, such as AT&T and Accenture, who are committed to broaden the tech talent pipeline.</p>
                <p>If fully utilized, this represents a total of $10 million committed by Udacity and tech employers.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="yeswecode-content">
                <h3></h3>
                <p>In support of the TechHire strategies, <strong><a href="http://www.yeswecode.org/" target="_blank">#YesWeCode</a></strong> commits to delivering $10 million in scholarships for 2,000 underserved minorities across the nation, to attend coding bootcamps over the next ten years.</p>
                <p>#YesWeCode also commits to launching a national job-training pilot in Oakland, California in 2015.</p>
                <p>Through this pilot, they will design a 9-month, industry-driven model to successfully prepare students from low-opportunity backgrounds for careers as software engineers.</p>
                <p>In partnership with celebrities, athletes, tech and political leaders, and other influencers, the mission of #YesWeCode is to find, finance, and encourage 100,000 non-traditional students to become top-level coders.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="capital_one-content">
                <h3></h3>
                <p><strong><a href="https://www.capitalone.com/" target="_blank">Capital One</a></strong>, through its FutureEdge initiative, a $150 million effort that will help increase tech skills and hiring, will collaborate with Opportunity@Work to provide support tailored to the needs of communities.</p>
                <p>Capital One has also committed to a hiring approach based on demonstrated competencies in coding or programming in partnership with HackerRankX and other similar organizations.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="cisco-content">
                <h3></h3>
                <p>In communities adopting TechHire strategies, <strong><a href="http://www.cisco.com/" target="_blank">Cisco</a></strong> will provide select individuals interested in career opportunities in IT with access to a Cisco Learning Network Premium online subscription.</p>
                <p>This subscription will include IT networking skills training from the industry-leading Cisco CCENT®, CCNA®, and CCNP® certification content library, which consists of hundreds of assets organized by certification, technology, and learning modality.</p>
                <p>It also includes exam preparation materials along with access to virtual labs to teach and provide hands-on preparation for individuals interested in pursuing high-demand careers in networking-related fields such as network security, the Internet of Things, industrial networking, and enterprise network design.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="edx-content">
                <h3></h3>
                <p><strong><a href="https://www.edx.org/" target="_blank">EdX</a></strong>, a non-profit organization founded by Harvard and MIT that offers free online courses in computer science and IT development training and from universities, colleges and institutions across the world, has committed to support TechHire by offering free verified certificates in two high-demand computer science programming courses to anyone in high need areas and communities implementing TechHire strategies.</p>
                <p>These free certificates, typically valued at $100, will be available for the next year.</p>
                <p>The courses will help to bridge the tech talent gap and skill-up unemployed and underemployed individuals.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="galvanize-content">
                <h3></h3>
                <p><strong><a href="http://www.galvanize.com/" target="_blank">Galvanize</a></strong></p>
                <p></p>
                <p></p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="hackbright_academy-content">
                <h3></h3>
                <p><strong><a href="https://hackbrightacademy.com/" target="_blank">Hackbright Academy</a></strong>, a coding bootcamp for women, is working to close the gender gap in engineering and will commit staff, technical assistance, and travel time to engage with communities interested in starting or recruiting coding schools.</p>
                <p>In total, Hackbright Academy will make available 160 hours of staff time per year to consult with communities.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="sabio-content">
                <h3></h3>
                <p><strong><a href="http://www.sabio.la/" target="_blank">Sabio.la</a></strong>, a minority/woman-owned and operated web developer training program based out of Los Angeles, will create career-centric programming and curriculum to include web development training in communities and organizations.</p>
                <p>They will collaborate with LA Tech employers and recruiters to create its project-based curriculum and engage with elected officials from municipalities, school boards, non-profits dedicated to serving Latinos and African Americans to access their target populations.</p>
                <p>In addition, Sabio will commit to hosting free monthly coding workshops with nonprofits to increase awareness of the world of coding, and to increase access to free coding programs and resources.</p>
              </div>
            </div>

            <div class="col">
              <div class="content-dropdown" id="year_up-content">
                <h3></h3>
                <p><strong><a href="http://www.yearup.org/" target="_blank">Year Up</a></strong>, a one-year, intensive training program that provides urban young adults 18-24 with a combination of technical and professional skills, college credits, an educational stipend, and a corporate internship, commits to serve 25 percent more young people – at least 500 more young adults – over the next 12 months.</p>
                <p>Year Up currently operates in 14 cities, and as Year Up continues to scale in the coming years, it will prioritize communities implementing TechHire strategies, focusing, in particular, on communities where large employers have committed to participate in this initiative and build new pipelines of talent.</p>
              </div>
            </div>
          </div>
        </div>

        <div class="mod-content yellow">
          <div class="layout-wrap icon-sheet">
            <div class="col">
              $LOCATION8
            </div>
          </div>
        </div>

        <div class="mod-content">
          <div class="layout-wrap">
            <div class="col">
              $LOCATION9
            </div>
          </div>
        </div>
      HTML
    ).find_or_create_by(name: "Tools and Resources")

    Page.create_with(number_of_locations: 1,
                    template: <<-HTML.strip_heredoc
        <div class="mod-heading tools">
          <h1>Case Study: Capital One</h1>
        </div>
        <div class="mod-content">
          <div class="layout-wrap">
            <span class="capital-one case-study-logo"></span>
            </div>
        </div>
          <div class="layout-wrap icon-case">
            <div class="col">
              $LOCATION1
            </div>
          </div>
        </div>
      HTML
    ).find_or_create_by(name: "Capital One")


    Page.create_with(number_of_locations: 2,
                      template: <<-HTML.strip_heredoc
        <div class="mod-heading tools">
          <h1>Case Study: Rural Sourcing, Inc.</h1>
        </div>

        <div class="mod-content">
          <div class="layout-wrap">
            <span class="rural-sourcing case-study-logo"></span>
        </div>
          <div class="layout-wrap icon-case">
            <div class="col">
              $LOCATION1
            </div>
          </div>
        </div>

        <div class="mod-content yellow">
          <div class="layout-wrap icon-check">
            <div class="col">
              $LOCATION2
            </div>
          </div>
        </div>
      HTML
    ).find_or_create_by(name: "Rural Sourcing")

    Page.create_with(number_of_locations: 2,
                    template: <<-HTML.strip_heredoc
        <div class="mod-heading tools">
          <h1>Case Study: Xpanxion</h1>
        </div>

        <div class="mod-content">
          <div class="layout-wrap">
            <span class="xpanxion case-study-logo"></span>
          </div>
          <div class="layout-wrap icon-case">
            <div class="col">
              $LOCATION1
            </div>
          </div>

          <div class="mod-content yellow">
            <div class="layout-wrap icon-check">
              <div class="col">
                $LOCATION2
              </div>
            </div>
          </div>
        </div>
      HTML
    ).find_or_create_by(name: "Xpanxion")

    Page.create_with(number_of_locations: 0, navigation: true,
                     template: <<-HTML.strip_heredoc
      <div class="mod-heading location">
        <h1>TechHire Rhode Island</h1>
      </div>
      <div class="mod-map layout-wrap">
        <p style="text-align: center;">Delivering in-demand tech talent for Rhode Island’s companies.</p>

        <p>TechHire Rhode Island is a new statewide initiative for delivering in-demand tech talent for Rhode Island companies in collaboration with Governor Raimondo, Rhode Island state agencies, local businesses, educational institutions and community-based organizations. Its focus is four-fold:</p>

        <p>1. <strong>Employer driven</strong>, working with employers across industry to build hiring solutions aligned to IT job and training needs;</p>

        <p>2. <strong>Unlocking new talent</strong>, expanding the local IT talent pool by hiring for mastery, not pedigree;</p>

        <p>3. <strong>Growing proven education and training solutions</strong>, to include new higher education computer science (CS) minors/majors and best-in-class bootcamps and hiring onramps, like LaunchCode; and</p>

        <p>4. <strong>Funding success</strong>, such as the Wavemaker Fellowship for repaying tech job candidate student loans, as well as RealJobs RI industry partnerships and CS training offerings.</p>

        <p>TechHire Rhode Island's partner for skills assessment and job placement is <a href="https://www.launchcode.org/rhodeisland/hire" target="_blank">LaunchCode</a>.</p>

        <section class="mod-stories layout-wrap">
          <div class="story launchcode">
            <a href="/rhode_island/apply" target="_blank" class="button">Job Seekers</a>
          </div>
          <div class="story launchcode">
            <a href="/rhode_island/employers" target="_blank" class="button">Employers</a>
          </div>
        </section>

        <table>
          <tr>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/amica_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/atrion_logo.jpg');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/brave_river_solutions_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/brown_logo.jpeg');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/ccri_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/citizens_bank_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/commerce_ri_logo.png');"></span>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/ed_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/edx_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/envision_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/hasbro_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/igt_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/innovex_logo.jpg');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/launchcode_logo.png');"></span>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/new_england_institute_of_tech_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/new_horizons_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/prepare_ri_logo.jpg');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/prov_plan_logo.jpg');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/ptech_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/purvis_systems_logo.jpg');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/ri_dlt_logo.jpg');"></span>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/ri_state_seal_logo.jpg');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/risd_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/rjri_logo.jpg');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/secure_future_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/senedia_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/shape_up_logo.png');"></span>
              </div>
            </td>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/tech_collective_logo.jpg');"></span>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div>
                <span class="knack-logo private-sector-tool-logo" style="background-image: url('/assets/univ_of_ri_logo.png');"></span>
              </div>
            </td>
          </tr>
        </table>
      </div>
    HTML
    ).find_or_create_by(name: "TechHire Rhode Island")

    puts "pages built"
  end

  def build_content
    # ==== Build Home Page Content ====
    Content.create_with(page_id: Page.find_by(name: "Home").id, location: 1, body: <<-HTML.strip_heredoc
        <h1>￼Connecting Businesses, Communities and the Tech Talent Pipeline</h1>
      HTML
    ).find_or_create_by(name: "home1")

    Content.create_with(page_id: Page.find_by(name: "Home").id, location: 2, body: <<-HTML.strip_heredoc
        <h1>How Monsanto is doing it</h1>
        <div class="embed-container">
          <iframe src="https://player.vimeo.com/video/126637482" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="https://vimeo.com/126637482" target="_blank">Kara, Marquis and Caleb @ Monsanto</a> from <a href="https://vimeo.com/user32162469" target="_blank">LaunchCode</a> on <a href="https://vimeo.com" target="_blank">Vimeo</a>.</p>
        </div>
      HTML
    ).find_or_create_by(name: "home2")

    Content.create_with(page_id: Page.find_by(name: "Home").id, location: 3, body: <<-HTML.strip_heredoc
        <h1>How Capital One is doing it</h1>
        <div class="embed-container">
          <iframe width="560" height="315" src="https://www.youtube.com/embed/85hEQF2GkyE" frameborder="0" allowfullscreen></iframe>
        </div>
        <p>&nbsp;</p>
      HTML
    ).find_or_create_by(name: "home3")
    # ==== END ====

    # ==== Build Learn More Page Content ====
    Content.create_with(page_id: Page.find_by(name: "Learn More").id, location: 1, body: <<-HTML.strip_heredoc
        <iframe frameborder="0" src="https://www.youtube-nocookie.com/embed/3iiXLXo2hic?rel=0&amp;showinfo=0"></iframe>
      HTML
    ).find_or_create_by(name: "learn_more1")

    Content.create_with(page_id: Page.find_by(name: "Learn More").id, location: 2, body: <<-HTML.strip_heredoc
        <p>
          Beginning with the 21 communities of the TechHire initiative – announced by President Obama in March 2015 – which today represent over 130,000 open IT jobs, Opportunity<span class="opportunity-at">@</span>Work will work with a range of technology, private sector, and philanthropic partners to create freely available tools to streamline the sign-up and participation of thousands of employers in inclusive hiring, and to facilitate a nationwide learning network to rapidly improve the impact of TechHire. Over 300 employers have already signed on.
        </p>
        <p>
          The 35 TechHire communities are committed to taking action – working with each other, employers, training institutions, and other partners – to create a better marketplace for IT jobs. TechHire communities – including cities, small states, and rural areas - have announced plans to work together in new ways to recruit and place applicants based on their actual skills and to create more fast track tech training opportunities, based on market-wide hiring needs.
        </p>
        <p>
          TechHire communities will build a talent pipeline by leveraging their 4-year universities and community colleges, but will also leverage non-traditional approaches, including hiring on-ramps for people with the skills but not the pedigree to be hired in traditional ways, accelerated coding “boot camps,” and high-quality online courses that prepare workers for well-paying IT jobs, often in just a few months.
        </p>
        <p>
          The long-term objective of TechHire is to create the labor market conditions nationally that enable employers to "hire when ready" and job seekers to be aware of, prepare for, and connect with IT jobs and careers. By creating compelling proof points in communities throughout the country; uncovering common challenges; developing scalable solutions; and bringing to bear national and regional partnerships and resources, TechHire, with support from Opportunity<span class="opportunity-at">@</span>Work, will serve as a catalyst to transforming the broader labor market.
        </p>
      HTML
    ).find_or_create_by(name: "learn_more2")

    Content.create_with(page_id: Page.find_by(name: "Learn More").id, location: 3, body: <<-HTML.strip_heredoc
        <h2>The Case for Businesses</h2>
        <p>Meaningful work is essential to human flourishing and to America’s promise of upward mobility and civic equality, while tapping the full talents of our people is essential for productive and inclusive economic growth. The gradual erosion of such work for many in the US economy over the past 30 years threatens both America’s promise and economic vitality.</p>
        <p>Every day that goes by without filling an open position costs a business $434 on average. This number is likely higher for IT jobs which take an average of 95 business days to fill - higher than the overall average. Committing to TechHire means access to an expanded hiring pool with qualified candidates who are ready to work, but may have previously been overlooked.</p>
      HTML
    ).find_or_create_by(name: "learn_more3")

    Content.create_with(page_id: Page.find_by(name: "Learn More").id, location: 4, body: <<-HTML.strip_heredoc
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
    ).find_or_create_by(name: "learn_more4")

    Content.create_with(page_id: Page.find_by(name: "Learn More").id, location: 5, body: <<-HTML.strip_heredoc
        <h2>Self-defeating Employer Practices</h2>
        <ul class="bulleted">
          <li>
            <b>Creeping credentialism:</b> 19% of administrative assistants have a four-year college degree but 65% of new assistant jobs require it
          </li>

          <li>
            <b>Bias in hiring:</b> 45% lower callback rate for LTU versus recently employed despite identical education, skills and experience and evidence of no difference in job performance
          </li>
        </ul>
      HTML
    ).find_or_create_by(name: "learn_more5")

    Content.create_with(page_id: Page.find_by(name: "Learn More").id, location: 6, body: <<-HTML.strip_heredoc
        <h2>Lack of Replication and Scale</h2>
        <ul class="bulleted">
          <li>
            <b>Scale is elusive:</b> there are pockets of success but scale remains too slow, costly and complex – as each one invents or re-invents its own approach
          </li>

          <li>
            <b>Inefficient resource allocation:</b> limited data and no marketplace to evaluate what is and is not working
          </li>
        </ul>
      HTML
    ).find_or_create_by(name: "learn_more6")

    Content.create_with(page_id: Page.find_by(name: "Learn More").id, location: 7, body: <<-HTML.strip_heredoc
        <p>
        Opportunity<span class="opportunity-at">@</span>Work is a civic enterprise whose mission is to re-wire the U.S. labor market to enable more Americans to achieve upward mobility in the job market and workplace, to facilitate actions by U.S. employers to develop the talent they collectively need to succeed and grow, and to scale up innovations that unlock more fully all people’s potential for higher-value, meaningful work as a source of economic opportunity and national competitive advantage.
        </p>
        <p style="text-align:center;" >You can also read more about TechHire by visiting the <a href="https://www.whitehouse.gov/issues/technology/techhire">White House page</a>.</p>
      HTML
    ).find_or_create_by(name: "learn_more7")
    # ==== END ====

    # ==== Build Tools/Resources Page Content ====
    Content.create_with(page_id: Page.find_by(name: "Tools and Resources").id, location: 1, body: <<-HTML.strip_heredoc
        <h2>Case Study: Xpanxion</h2>
        <p>
          Xpanxion is an enterprise software consulting firm with locations in smaller towns throughout
          the United States. In order to maintain offices outside of traditional tech centers, Xpanxion has invested
          heavily in training and career development, resulting in a strong supply of quality, local talent.
          <a href="/case_studies/xpanxion">Read about Xpanxion's training strategy.</a>
        </p>
      HTML
    ).find_or_create_by(name: "tools_resource1")

    Content.create_with(page_id: Page.find_by(name: "Tools and Resources").id, location: 2, body: <<-HTML.strip_heredoc
        <h2>Case Study: Capital One</h2>
        <p>
          To expand the tech talent pipeline, Capital One has committed to a hiring approach that requires demonstrated
          skill for virtually all coding and programming jobs. Capital One is hiring thousands of new technology and digital roles.
        </p>

        <p>
          <a href="case_studies/capital_one">See how Capital One helped Eric and Cory.</a>
        </p>
      HTML
    ).find_or_create_by(name: "tools_resource2")

    Content.create_with(page_id: Page.find_by(name: "Tools and Resources").id, location: 3, body: <<-HTML.strip_heredoc
        <h2>Case Study: Rural Sourcing Inc. (RSI)</h2>
        <p>
          Rural Sourcing is a software consultancy committed to solving the "outsourcing crisis" by bringing
          tech jobs back to American communities. RSI helps give tech employees the flexibility to live where
          they want while also making investments back into local economies.
          <a href="case_studies/rural_sourcing">Read about RSI's talent sourcing strategy.</a>
        </p>
      HTML
    ).find_or_create_by(name: "tools_resource3")

    Content.create_with(page_id: Page.find_by(name: "Tools and Resources").id, location: 4, body: <<-HTML.strip_heredoc
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
      HTML
    ).find_or_create_by(name: "tools_resource4")

    Content.create_with(page_id: Page.find_by(name: "Tools and Resources").id, location: 5, body: <<-HTML.strip_heredoc
      <h3>Career Management Platform for TechHire Community Members</h3>
      <p><strong><a href="http://www.betterweekdays.com/" target="_blank">Better Weekdays</a></strong> is a St. Louis based job-matching platform that helps universities improve job placement outcomes of its graduates, and companies to hire them based on job compatibility and culture fit.</p>
      <p>Better Weekdays has committed to providing its pay-walled web and mobile career management platform free of charge for colleges and universities, Local Leaders, and other partners in TechHire communities to leverage and facilitate connections between employers and job seekers.</p>
      <p>The service will feature a dashboard that connects job seekers to resources to prepare for gainful employment, and allows employers to showcase their brands in a meaningful way to aspiring employees.</p>
      HTML
    ).find_or_create_by(name: "tools_resource5")

    Content.create_with(page_id: Page.find_by(name: "Tools and Resources").id, location: 6, body: <<-HTML.strip_heredoc
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
      HTML
    ).find_or_create_by(name: "tools_resource6")

    Content.create_with(page_id: Page.find_by(name: "Tools and Resources").id, location: 7, body: <<-HTML.strip_heredoc
        <h3>Recruitment Guidance for Employers</h3>
        <p>
        <a href="http://www.executiveboard.com/" target="_blank">CEB</a> will develop their own best practices playbook for employers with CEB guidance to private and public employers on how to recruit tech talent from non-traditional sources.
        </p>
        <p>
        CEB will also provide free labor market snapshots from CEB Talent Neuron to select communities involved in the TechHire Initiative in order to surface job and skill segments where talent supply-demand gaps create opportunity for local workforce innovation.
        </p>
      HTML
    ).find_or_create_by(name: "tools_resource7")

    Content.create_with(page_id: Page.find_by(name: "Tools and Resources").id, location: 8, body: <<-HTML.strip_heredoc
        <h2>Fact Sheet</h2>
        <p>On March 9, 2015, President Obama announced the creation of the TechHire initiative — a new campaign to work with communities to get more Americans rapidly trained for well-paying technology jobs.</p>
        <p><a href="https://www.whitehouse.gov/the-press-office/2015/03/09/fact-sheet-president-obama-launches-new-techhire-initiative" class="button" target="_blank">Download the Factsheet</a></p>
      HTML
    ).find_or_create_by(name: "tools_resource8")

    Content.create_with(page_id: Page.find_by(name: "Tools and Resources").id, location: 9, body: <<-HTML.strip_heredoc
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
    ).find_or_create_by(name: "tools_resource9")
    # ==== END ====

    # ==== Build TechHire Page Content ====
    Content.create_with(page_id: Page.find_by(name: "TechHire Locations").id, location: 1, body: <<-HTML.strip_heredoc
        <h2>Where TechHire is Now</h2>
        <iframe width="100%" height="600" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//www.arcgis.com/apps/MapSeries/index.html?appid=d20555036a54406f859a99e8d094fe70"></iframe>
      HTML
    ).find_or_create_by(name: "tech_locations1")

    Content.create_with(page_id: Page.find_by(name: "TechHire Locations").id, location: 2, body: <<-HTML.strip_heredoc
        <h2>The TechHire Opportunity</h2>
        <p>President Obama has issued a call to action for more communities across the country to join the movement and create TechHire partnerships, and employers in communities all across the country are in critical need of more talent with IT skills. The interactive map below provides a picture of the TechHire opportunity -- it shows real-time the open IT jobs across the U.S.. Gaining an understanding of these  job openings and the specific skills required will be a key step for new communities developing TechHire partnerships.</p>
        <p>Click into a state to see where technology jobs are currently being advertised, represented by a pin in each local market. As you click into each pin, you will be able to browse available technology job listings in a particular community.</p>
      HTML
    ).find_or_create_by(name: "tech_locations2")

    Content.create_with(page_id: Page.find_by(name: "TechHire Locations").id, location: 3, body: <<-HTML.strip_heredoc
        <iframe src="https://www.glassdoor.com/Job/explorer/embed.htm?jobCat1=29" height="720" width="100%"></iframe>
      HTML
    ).find_or_create_by(name: "tech_locations3")

    Content.create_with(page_id: Page.find_by(name: "TechHire Locations").id, location: 4, body: <<-HTML.strip_heredoc
        <p>Open jobs data is provided by Glassdoor, Inc. which aggregates millions of U.S. job listings from a variety of online sources, including hiring employers and job boards as well as other online sources. Data is updated several times per day.</p>
      HTML
    ).find_or_create_by(name: "tech_locations4")
    # ==== END ====
    # ==== Build Case Studies ====
    Content.create_with(page_id: Page.find_by(name: "Rural Sourcing").id, location: 1, body: <<-HTML.strip_heredoc
        <h2>Bringing Quality Tech Jobs to Local Communities</h2>

        <p>
          At the core of Rural Sourcing Inc’s (RSI) business model is the belief that too many talented Americans are forced to choose between pursuing their ideal vocation or living in their ideal location.
        </p>

        <p>
          This choice or in reality tradeoff means that hundreds of thousands of Americans are either living in smaller cities but not pursuing fulfilling work or have left for the bright lights of the big city where the work is rewarding but the quality of life is not what they envisioned.
        </p>

        <p>
          RSI believes that no one should be forced to choose. We work hard to make sure that our colleagues get to experience fulfilling careers without having to sacrifice the quality of life they desire.
        </p>

        <p>
          We locate our software development centers in smaller cities and find talented software development professionals as well as grow new talent by partnering closely with local colleges and universities.
        </p>

        <p>
          We create a google-esque work environment with plenty of space for collaboration and an impromptu game of foosball. And, with Fortune 1000 clients that hire us to help develop new mobile applications, cloud based solutions or migrate old tech platforms on to newer more robust technologies our colleagues find the work both exciting and challenging.
        </p>
      HTML
    ).find_or_create_by(name: "rural_source1")

    Content.create_with(page_id: Page.find_by(name: "Rural Sourcing").id, location: 2, body: <<-HTML.strip_heredoc
        <h2>See How Rural Sourcing Helped Karen:</h2>
        <p>
          After four and a half years as a Senior Quality Assurance (QA) Engineer at eBay, I needed to leave my job to take care of my father.
        </p>

        <p>
          After three years, I was able to rejoin the workforce and decided to move from California to South Carolina to live in a place that was slower and had a better quality of life.
        </p>

        <p>
          Unfortunately, jobs were scarce. I was unable to find a position due to the downturn in the economy and the fact that companies were outsourcing many of the jobs that I could have gotten with my experience.
        </p>

        <p>
          In November of 2011, I saw an interview on TV with Monty Hamilton, CEO of Rural Sourcing, talking about how the company planned to bring jobs back to America.
        </p>

        <p>
          He said they were currently hiring developers and would be hiring for other tech positions soon. I decided to take a chance and send them my resume.
        </p>

        <p>
          In less than a month I had an interview at RSI and began working for the company in January of 2012 as the first QA Analyst in the Augusta site. That was three and a half years ago.
        </p>

        <p>
          If it wasn't for RSI and their vision, I would not have this great job that I have today with great people and a bright future. Thanks so much RSI for giving me my life back and believing in America again!
        </p>
      HTML
    ).find_or_create_by(name: "rural_source2")

    Content.create_with(page_id: Page.find_by(name: "Capital One").id, location: 1, body: <<-HTML.strip_heredoc
        <p><strong>Eric Greise</strong>, of Richmond, Virginia, has worked at Capital One as a manager in an operations center in Virginia for several years. This past fall, he received a scholarship from Capital One to complete a Nanodegree from the online university Udacity to formally teach him the programming skills needed for building modern digital applications.
        </p>

        <p>
        He is looking forward to graduating from the program soon and recently spent a day immersed with one of Capital One’s API development teams seeing how his skills can be applied. Upon graduation, Eric is planning to apply for a full-time junior software engineering role at Capital One.
        </p>

        <p>
        <strong>Cory Woods</strong>, of Richmond, Virginia, joined Capital One in 2014 as an intern through Capital One’s Autism@Work program, an internship program that provides on-the-job technical training and specialized support for individuals on the spectrum.
        </p>
        <p>
        While working as a system tester, Cory received on-the-job training and mastered a variety of web-based testing applications and tools. He performed the broad array of technical tasks so well that he was hired as a full-time testing specialist just six months after starting his internship.
        </p>

        <p>
        Today, Cory serves as a mentor for others with autism spectrum disorders, through organizations like Courage to Succeed, where he provides advice about therapies, support groups and other resources to help individuals on the spectrum advance both in school and at work.
        </p>

        <p>
        It’s Cory’s personal goal to help others understand autism spectrum disorders, proving that these diagnoses don’t halt professional and personal objectives.
        </p>
      HTML
    ).find_or_create_by(name: "cap_one1")

    Content.create_with(page_id: Page.find_by(name: "Xpanxion").id, location: 1, body: <<-HTML.strip_heredoc
        <h2>Investing in Training to Maintain Local Talent Supply</h2>
        <p>
          Xpanxion is a software engineering firm that provides solutions to businesses through software architecture, design, development, data analytics, and testing services.</p>
        <p>
          The company utilizes a unique business model which places offices in rural areas to leverage lower cost structures and bring high tech jobs to smaller communities.
        </p>

        <p>
          However, due to the lower population base, this approach also makes finding qualified talent more difficult in an already competitive and resource constrained industry.
          Xpanxion as a result has come to an interesting solution – the company invests heavily into training and career development to create its own IT talent pool.
        </p>
        <p>
          Through a rigorous interview process, candidates with strong aptitude and fit are identified and are brought into the organization to begin a regimented training process.
          This includes those that may not have IT experience, and to date, approximately 35% of Xpanxion’s 250 US employees are of non-traditional IT backgrounds.
        </p>

        <p>
          The success of the endeavor has led to high growth and expansion of the firm, so Xpanxion looks to partner with the TechHire initiative to leverage the obvious synergies.
        </p>
      HTML
    ).find_or_create_by(name: "xpan1")

    Content.create_with(page_id: Page.find_by(name: "Xpanxion").id, location: 2, body: <<-HTML.strip_heredoc
        <h2>See How Xpanxion Helped Jason and Michael:</h2>
        <p><strong>Jason Arens</strong></p>
        <p>
          After growing up in the agricultural industry, I earned my bachelor’s degree in Journalism and began a career in sports media. When I decided to pursue a different career path a few years later, I came knocking on Xpanxion’s door with an unrelated background, but the will to learn.
        </p>

        <p>
          I was given the opportunity and haven’t looked back since. Thanks to the company’s in-house training sessions and knowledge transfer from colleagues with expertise, I’ve grown in leaps and bounds through my first year to position myself as a valuable asset for the software services company as a Business and QA Analyst. It was undoubtedly the right move for me, and I look forward to continue growing within this ever-changing industry.
        </p>


        <p><strong>Michael Wortman</strong></p>

        <p>
          I became a member of the Xpanxion Team after spending 21 years in the military in multiple fields and managing a restaurant for over 10 years. During that time I realized that a lifestyle change was desperately needed. Working for Xpanxion was that change, and has been one of the most rewarding decisions I could have made.
        </p>
        <p>
          Previous experience had taught me to mold into whatever the situation called for. Now I am working throughout several QA teams guiding and assisting in multiple ways. Xpanxion is fantastic about finding and keeping good people on projects.
        </p>
        <p>
          They also make sure that almost any tools or resources needed to make you successful are available. I feel that Xpanxion brought me on as part of their team because they saw my eagerness to be part of a successful team, capacity to grow, self-motivation, and long term dedication.
        </p>
      HTML
    ).find_or_create_by(name: "xpan2")

    Content.create_with(page_id: Page.find_by(name: "Xpanxion").id, location: 3, body: <<-HTML.strip_heredoc

      HTML
    ).find_or_create_by(name: "xpan3")

    # ==== END ====
    puts "content built"
  end

  def build_pdf
    pdf = Pdf.create
    pdf.pdf_file = File.open("public/assets/pdfs/EmployerPlaybook.pdf")
    pdf.save

    puts "PDF built"
  end

  def build_users
    User.create_with(email: "admin@gmail.com", password: "password", role: 1).find_or_create_by(name: "admin")
    User.create_with(email: "tim@gmail.com", title: "title", password: "password", role: 0).find_or_create_by(name: "Tim")
    User.create_with(email: "marissa@gmail.com", title: "jobs", password: "password", role: 0).find_or_create_by(name: "Marissa")
    User.create_with(email: "josh@gmail.com", title: "teacher", password: "password", role: 0).find_or_create_by(name: "JOSH")
    User.create_with(email: "mike@gmail.com", title: "teacher", password: "password", role: 0).find_or_create_by(name: "Mike")
    User.create_with(email: "horace@gmail.com", title: "teacher", password: "password", role: 0).find_or_create_by(name: "Horace")
    User.create_with(email: "jeff@gmail.com", title: "teacher",password: "password", role: 0).find_or_create_by(name: "Jeff")
    puts "users built"
  end
end
Seed.new
