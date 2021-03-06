package org.kuali.kd2013.dataobject;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.kuali.rice.krad.data.jpa.eclipselink.PortableSequenceGenerator;
import org.kuali.rice.krad.data.provider.annotation.InheritProperties;
import org.kuali.rice.krad.data.provider.annotation.InheritProperty;
import org.kuali.rice.krad.data.provider.annotation.Label;

@Entity
@Table(name="KD13_SESS_PRES_T")
public class SessionPresenter implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="SESS_PRES_ID",length=10)
	@GeneratedValue(generator="KD13_SESS_PRES_ID_S")
	@PortableSequenceGenerator(name="KD13_SESS_PRES_ID_S")
	protected String sessionPresenterId;

	@Column(name="SESS_ID",length=10)
	protected String sessionId;

	@Column(name="PRES_ID",length=10)
	protected String presenterId;

	@Column(name="PRIMARY_IND")
	protected Boolean primary = Boolean.FALSE;

	@ManyToOne(fetch=FetchType.EAGER,cascade={CascadeType.REFRESH,CascadeType.DETACH})
	@JoinColumn(name="PRES_ID",referencedColumnName="PRES_ID",updatable=false,insertable=false)
	@InheritProperties({ 
			@InheritProperty(name = "name",label = @Label("Presenter Name")),
			@InheritProperty(name = "institution")})
	protected PresenterInfo presenter;


	public String getSessionPresenterId() {
		return sessionPresenterId;
	}

	public void setSessionPresenterId(String sessionPresenterId) {
		this.sessionPresenterId = sessionPresenterId;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getPresenterId() {
		return presenterId;
	}

	public void setPresenterId(String presenterId) {
		this.presenterId = presenterId;
	}

	public boolean isPrimary() {
		return primary;
	}

	public void setPrimary(boolean primary) {
		this.primary = primary;
	}

	public PresenterInfo getPresenter() {
		return presenter;
	}

	public void setPresenter(PresenterInfo presenter) {
		this.presenter = presenter;
	}
}
