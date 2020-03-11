package com.guideme.model;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
	GUIDE, TOURIST;

	@Override
	public String getAuthority() {
		return name();
	}
}
