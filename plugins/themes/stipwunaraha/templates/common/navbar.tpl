{**
 * templates/common/navbar.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}

<header>
<style type="text/css">
.lm-masthead > :first-of-type > .lm-column, .lm-masthead > :first-child > .lm-column {padding-bottom: 3.2%;padding-top: 2.8%;}
</style>
<div class="lm-masthead Wrapper-4206806225" role="banner">
<div class="lm-live-area">
	<div class="lm-column">
		<h1 class="lm-brand"><a rel="home" href="/"><img src="//www.media.stipwunaraha.ac.id/static/stipwunaraha_logo_dark.svg" alt="Stipwunaraha Research Media"></a></h1>
		<ul class="navMenu nav-left" role="navigation">
			{if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="index"}">{translate key="navigation.otherJournals"}</a></li>
			{/if}{* $categoriesEnabled *}
			<li id="getPublished"><a href="{url page="about" op="submissions" anchor="onlineSubmissions"}">{translate key="common.published"}</a></li>
			<li id="aboutCOSIRE"><a href="https://scofci.stipwunaraha.ac.id/organisasi/">{translate key="common.cosire"}</a></li>
	    </ul>
		<nav class="lm-additional-nav">
        <ul >
            {if $isUserLoggedIn}
            {if $hasOtherJournals}
			<li id="userJournal"><a href="{url journal="$currentJournal" page="user"}">My Journals</a></li>
			    {/if}
			<li id="userProfile"><a href="{url page="user" op="profile"}">My Profile</a></li>
			<li id="userHome"><a href="{url page="user"}">User Home</a></li>
			<li id="userLogOut"><a href="{url page="login" op="signOut"}">Log Out</a></li>
			{if $userSession->getSessionVar('signedInAs')}
			    <li id="userLogOutUser"><a href="{url page="login" op="signOutAsUser"}">Log Out as User</a></li>
		    	{/if}
    		{else}
			<li id="userlogin"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
			{if !$hideRegisterLink}
			<li id="userRegister"><a href="{url page="user" op="register"}" >{translate key="navigation.register"}</a></li>
			    {/if}
    		{/if}{* $isUserLoggedIn *}
		</ul>
		</nav>
    {include file="common/search.tpl"}
</div> 
</div> <!-- End navbar -->

<div role="navigation" class="lm-primary-navigation">
	<div class="lm-live-area">
		<div class="lm-column">
			<ul class="lm-nav-root">
				<li><a href="#">Subjects <svg class="lm-icon-arrow-down" viewBox="0 0 32 32"><path fill="inherit" d="M28 11.5c0-0.4-0.1-0.8-0.4-1.1-0.6-0.6-1.5-0.6-2.1 0l-9.5 10.2-9.4-10.2c-0.6-0.6-1.5-0.6-2.1 0-0.6 0.6-0.6 1.5 0 2.1l10.1 10.9c0.8 0.8 2 0.8 2.8 0l10.2-10.9c0.3-0.3 0.4-0.7 0.4-1.1z"></path></svg></a>
					<ul class="lm-nav-sub">
						<li></li>
					</ul>
				</li>
				<li><a href="#">Publishing with us <svg class="lm-icon-arrow-down" viewBox="0 0 32 32"><path fill="inherit" d="M28 11.5c0-0.4-0.1-0.8-0.4-1.1-0.6-0.6-1.5-0.6-2.1 0l-9.5 10.2-9.4-10.2c-0.6-0.6-1.5-0.6-2.1 0-0.6 0.6-0.6 1.5 0 2.1l10.1 10.9c0.8 0.8 2 0.8 2.8 0l10.2-10.9c0.3-0.3 0.4-0.7 0.4-1.1z"></path></svg></a>
					<ul class="lm-nav-sub">
						<li></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>

</div>
</header>