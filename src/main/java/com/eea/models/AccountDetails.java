package com.eea.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="account_details")
public class AccountDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer accountDetailsId;
	
	@Column(name="profile_views")
	private Integer profileViews;

	@Column(name = "about")
	private String about;

	@Lob
	@Column(name="account_image")
	private byte[] accountImage;

	@Column(name = "account_followers")
	private Integer followers;

	@OneToOne
	@JoinColumn(name="account_id",referencedColumnName ="accountId")
	private Account account;

	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "account_details_id",referencedColumnName = "accountDetailsId")
	private List<Post> accountPost;

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public List<Post> getAccountPost() {
		return accountPost;
	}

	public void setAccountPost(List<Post> accountPost) {
		this.accountPost = accountPost;
	}

	public Integer getAccountDetailsId() {
		return accountDetailsId;
	}

	public void setAccountDetailsId(Integer accountDetailsId) {
		this.accountDetailsId = accountDetailsId;
	}

	public Integer getProfileViews() {
		return profileViews;
	}

	public void setProfileViews(Integer profileViews) {
		this.profileViews = profileViews;
	}

	public byte[] getAccountImage() {
		return accountImage;
	}

	public void setAccountImage(byte[] accountImage) {
		this.accountImage = accountImage;
	}

	public Integer getFollowers() {
		return followers;
	}

	public void setFollowers(Integer followers) {
		this.followers = followers;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
}
