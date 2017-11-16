<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="apple-touch-icon-precomposed" href="<c:url value='resources/plugin/css/wizardcss.css'/>">
    

</head>
<body>


	<div class="wrapper">
		<div id="wizard" class="wizard">
			<div class="wizard__content">
				<header class="wizard__header">
				<div class="wizard__header-overlay"></div>

				<div class="wizard__header-content">
					<h1 class="wizard__title">Get start with Javascript!</h1>
					<p class="wizard__subheading">
						Start with <span>3</span> simple steps.
					</p>
				</div>

				<div class="wizard__steps">
					<nav class="steps">
					<div class="step">
						<div class="step__content">
							<p class="step__number">
								<i class="fa fa-github-alt"></i>
							</p>
							<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 52 52"> <circle class="checkmark__circle"
								cx="26" cy="26" r="25" fill="none" /> <path
								class="checkmark__check" fill="none"
								d="M14.1 27.2l7.1 7.2 16.7-16.8" /> </svg>

							<div class="lines">
								<div class="line -start"></div>

								<div class="line -background"></div>

								<div class="line -progress"></div>
							</div>
						</div>
					</div>

					<div class="step">
						<div class="step__content">
							<p class="step__number">
								<i class="fa fa-book"></i>
							</p>
							<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 52 52"> <circle class="checkmark__circle"
								cx="26" cy="26" r="25" fill="none" /> <path
								class="checkmark__check" fill="none"
								d="M14.1 27.2l7.1 7.2 16.7-16.8" /> </svg>

							<div class="lines">
								<div class="line -background"></div>

								<div class="line -progress"></div>
							</div>
						</div>
					</div>

					<div class="step">
						<div class="step__content">
							<p class="step__number">
								<i class="fa fa-group"></i>
							</p>
							<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 52 52"> <circle class="checkmark__circle"
								cx="26" cy="26" r="25" fill="none" /> <path
								class="checkmark__check" fill="none"
								d="M14.1 27.2l7.1 7.2 16.7-16.8" /> </svg>

							<div class="lines">
								<div class="line -background"></div>

								<div class="line -progress"></div>
							</div>
						</div>
					</div>
					</nav>
				</div>
				</header>


				<div class="panels">
					<div class="panel">
						<header class="panel__header">
						<h2 class="panel__title">Create a Github account</h2>
						<p class="panel__subheading">With github you can show your
							projects and find new things everyday!</p>
						</header>

						<p class="panel__content">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna culpa qui officia deserunt mollit anim id
							est laborum.</p>

						<p class="panel__content">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit.</p>
					</div>

					<div class="panel">
						<header class="panel__header">
						<h2 class="panel__title">Learn more about pure Javascript.</h2>
						<p class="panel__subheading">We have cool frameworks, but none
							is better then VanillaJS</p>
						</header>

						<p class="panel__content">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna culpa qui officia deserunt mollit anim id
							est laborum.</p>
						<p class="panel__content">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna culpa qui officia deserunt mollit anim id
							est laborum.</p>
					</div>

					<div class="panel">
						<header class="panel__header">
						<h2 class="panel__title">Stay in touch with the community.</h2>
						<p class="panel__subheading">Community is everything, and here
							we do some crazy stuff.</p>
						</header>

						<p class="panel__content">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna culpa qui officia deserunt mollit anim id
							est laborum.</p>
					</div>
				</div>

				<div class="wizard__footer">
					<button class="button previous">Previous</button>
					<button class="button next">Next</button>
				</div>
			</div>

			<h1 class="wizard__congrats-message">Congratulations, you are
				now in a world of pain and suffering!</h1>
		</div>
	</div>

<script type="text/javascript" src="<c:url value='resources/js/wizard.js'/>"></script>
    


</body>
</html>