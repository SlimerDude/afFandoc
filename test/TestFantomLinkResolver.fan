using fandoc::Link

class TestFantomLinkResolver : Test {
	
	Void testLinkResolver() {
		linkResolver := FandocLinkResolver()
		elem		 := Link("")
		url			 := null as Uri

		// pod::index         pod         absolute link to pod index
		// pod::pod-doc       pod         absolute link to pod doc chapter
		// pod::Type          Type        absolute link to type qname
		// pod::Types.slot    Type.slot   absolute link to slot qname
		// pod::Chapter       Chapter     absolute link to book chapter
		// pod::Chapter#frag  Chapter     absolute link to book chapter anchor

		url = linkResolver.resolve(elem, "sys", `sys::index`)
		verifyEq(url, `http://fantom.org/doc/sys/`)

		url = linkResolver.resolve(elem, "sys", `sys::pod-doc`)
		verifyEq(url, `http://fantom.org/doc/sys/`)

		url = linkResolver.resolve(elem, "sys", `sys::Type`)
		verifyEq(url, `http://fantom.org/doc/sys/Type`)

		url = linkResolver.resolve(elem, "sys", `sys::Type.slot`)
		verifyEq(url, `http://fantom.org/doc/sys/Type#slot`)

		url = linkResolver.resolve(elem, "docLang", `doclang::Methods`)
		verifyEq(url, `http://fantom.org/doc/docLang/Methods`)

		url = linkResolver.resolve(elem, "docLang", `doclang::Methods#this`)
		verifyEq(url, `http://fantom.org/doc/docLang/Methods#this`)
	}
}
